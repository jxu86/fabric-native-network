export FABRIC_CFG_PATH=$(pwd)/config/
export CORE_PEER_LOCALMSPID=Org1MSP
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_MSPCONFIGPATH=$(pwd)/config/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp

CHANNEL_NAME="mychannel"
CC_SRC_PATH=$(pwd)/chaincode/simpleContract
CC_NAME="simple"
CC_VERSION="1"
echo "##chaincode package"
peer lifecycle chaincode package ${CC_SRC_PATH}/${CC_NAME}.tar.gz --path ${CC_SRC_PATH} --lang golang --label ${CC_NAME}_${CC_VERSION}
echo "##chaincode install"
peer lifecycle chaincode install ${CC_SRC_PATH}/${CC_NAME}.tar.gz 
peer lifecycle chaincode queryinstalled  >&log.txt
cat log.txt
PACKAGE_ID=$(sed -n "/${CC_NAME}_${CC_VERSION}/{s/^Package ID: //; s/, Label:.*$//; p;}" log.txt)
echo $PACKAGE_ID
# PACKAGE_ID="simple_1:74b1d69dd5dab187f53e2c3b54b7217b2d486ca5a9229d28b205eeec1644cfc4"
CC_SEQUENCE="1"
INIT_REQUIRED="--init-required"
PEER_CONN_PARMS="localhost:7051"
CC_END_POLICY="--signature-policy AND('Org1MSP.peer')"
CC_INIT_FCN="Create"
fcn_call='{"function":"Create","Args":["a","10"]}'
echo "##chaincode approveformyorg"
peer lifecycle chaincode approveformyorg -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --channelID $CHANNEL_NAME --name ${CC_NAME} --version ${CC_VERSION} --package-id ${PACKAGE_ID} --sequence ${CC_SEQUENCE} ${INIT_REQUIRED} --waitForEvent
echo "##chaincode checkcommitreadiness"
peer lifecycle chaincode checkcommitreadiness --channelID $CHANNEL_NAME --name ${CC_NAME} --version ${CC_VERSION} --sequence ${CC_SEQUENCE} ${INIT_REQUIRED} --output json
echo "##chaincode commit"
peer lifecycle chaincode commit -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com --channelID $CHANNEL_NAME --name ${CC_NAME} --peerAddresses $PEER_CONN_PARMS --version ${CC_VERSION} --sequence ${CC_SEQUENCE} ${INIT_REQUIRED} 
peer lifecycle chaincode querycommitted --channelID mychannel --name ${CC_NAME}
peer lifecycle chaincode queryapproved -C mychannel -n simple
echo "##chaincode invoke"
peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com -C $CHANNEL_NAME -n ${CC_NAME} --isInit -c ${fcn_call}
sleep 2
echo "##chaincode query"
peer chaincode query -C $CHANNEL_NAME -n ${CC_NAME} --peerAddresses localhost:7051 -c '{"Args":["Read","a"]}'
echo "##chaincode invoke"
peer chaincode invoke -o localhost:7050 --ordererTLSHostnameOverride orderer.example.com  -C $CHANNEL_NAME -n ${CC_NAME} --peerAddresses localhost:7051 -c '{"Args":["Update","a","110"]}' 
sleep 2
echo "##chaincode query"
peer chaincode query -C $CHANNEL_NAME -n ${CC_NAME} --peerAddresses localhost:7051 -c '{"Args":["Read","a"]}'

# peer chaincode invoke -o localhost:7050--ordererTLSHostnameOverride orderer.example.com  -C "mychannel" -n "simple" --peerAddresses localhost:7051 -c '{"Args":["invoke","Create","a","110"]}' 
