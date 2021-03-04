

export FABRIC_CFG_PATH=$(pwd)/config/
export CHANNEL_NAME=mychannel
export CORE_CHAINCODE_MODE=dev
export CORE_PEER_ID=peer0.org1.example.com
export CORE_PEER_ADDRESS=peer0.org1.example.com:7051
export CORE_PEER_LOCALMSPID=Org1MSP
# export CORE_PEER_MSPCONFIGPATH=/Users/jc/Documents/project/hyperledger/hyfa/native-network/config/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
export CORE_PEER_MSPCONFIGPATH=$(pwd)/config/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
peer channel create -o localhost:7050 -c mychannel --ordererTLSHostnameOverride orderer.example.com -f ./channel-artifacts/mychannel.tx --outputBlock ./channel-artifacts/mychannel.block #--tls --cafile $ORDERER_CA

export CORE_PEER_LOCALMSPID=Org1MSP
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_MSPCONFIGPATH=$(pwd)/config/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
peer channel join -b ./channel-artifacts/mychannel.block


export CORE_PEER_LOCALMSPID=Org1MSP
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_MSPCONFIGPATH=$(pwd)/config/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
peer channel update -o localhost:7050 -c mychannel -f  $(pwd)/channel-artifacts/Org1MSPanchors.tx


