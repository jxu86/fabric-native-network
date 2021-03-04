# export CORE_PEER_LOCALMSPID=Org1MSP
# # export CORE_PEER_TLS_ROOTCERT_FILE=/Users/jc/Documents/project/hyperledger/hyfa/native-network/config/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
# export CORE_PEER_MSPCONFIGPATH=/Users/jc/Documents/project/hyperledger/hyfa/native-network/config/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
# export ORDERER_CA=/Users/jc/Documents/project/hyperledger/hyfa/native-network/config/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
# # peer channel create -t 20s -o orderer.example.com:7050 -c mychannel -f /Users/jc/Documents/project/hyperledger/hyfa/native-network/channel-artifacts/channel.tx
# # peer channel create  -o orderer.example.com:7050 -c mychannel -f /Users/jc/Documents/project/hyperledger/hyfa/native-network/channel-artifacts/channel.tx

# peer channel create -o localhost:7050 -c mychannel --ordererTLSHostnameOverride orderer.example.com -f ./channel-artifacts/mychannel.tx --outputBlock ./channel-artifacts/mychannel.block --tls --cafile $ORDERER_CA


# export CORE_PEER_LOCALMSPID=Org1MSP
# export CORE_PEER_TLS_ROOTCERT_FILE=/Users/jc/Documents/project/hyperledger/hyfa/native-network/config/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
# export CORE_PEER_ADDRESS=localhost:7051
# export CORE_PEER_MSPCONFIGPATH=/Users/jc/Documents/project/hyperledger/hyfa/native-network/config/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
# export CORE_PEER_TLS_ENABLED=true
# # export PEER_CA=/Users/jc/Documents/project/hyperledger/hyfa/native-network/config/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/msp/tlscacerts/tlsca.org1.example.com-cert.pem
# peer channel join -b ./channel-artifacts/mychannel.block
# #  --tls --cafile $PEER_CA




export FABRIC_CFG_PATH=$(pwd)/config/
export CHANNEL_NAME=mychannel
export CORE_CHAINCODE_MODE=dev
export CORE_PEER_ID=peer0.org1.example.com
export CORE_PEER_ADDRESS=peer0.org1.example.com:7051
export CORE_PEER_LOCALMSPID=Org1MSP
#export ORDERER_CA=/Users/jc/Documents/project/hyperledger/hyfa/native-network/config/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem
export CORE_PEER_MSPCONFIGPATH=/Users/jc/Documents/project/hyperledger/hyfa/native-network/config/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
peer channel create -o localhost:7050 -c mychannel --ordererTLSHostnameOverride orderer.example.com -f ./channel-artifacts/mychannel.tx --outputBlock ./channel-artifacts/mychannel.block #--tls --cafile $ORDERER_CA

export CORE_PEER_LOCALMSPID=Org1MSP
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_MSPCONFIGPATH=/Users/jc/Documents/project/hyperledger/hyfa/native-network/config/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
peer channel join -b ./channel-artifacts/mychannel.block


export CORE_PEER_LOCALMSPID=Org1MSP
export CORE_PEER_ADDRESS=localhost:7051
export CORE_PEER_MSPCONFIGPATH=/Users/jc/Documents/project/hyperledger/hyfa/native-network/config/crypto-config/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
peer channel update -o localhost:7050 -c mychannel -f  /Users/jc/Documents/project/hyperledger/hyfa/native-network/channel-artifacts/Org1MSPanchors.tx


