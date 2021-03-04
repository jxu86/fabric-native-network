echo "######org1 peer startup start######"
echo "current path: $(pwd)"
echo "remove data/peer"
rm -rf ./data/peer
export FABRIC_CFG_PATH=$(pwd)/config/

export CORE_PEER_ID=peer0.org1.example.com
export CORE_CHAINCODE_MODE=dev
# export CORE_VM_ENDPOINT=unix:///host/var/run/docker.sock
# CORE_VM_DOCKER_HOSTCONFIG_NETWORKMODE=${COMPOSE_PROJECT_NAME}_test
export CORE_PEER_CHAINCODEADDRESS=192.168.31.67:7052
export CORE_PEER_CHAINCODELISTENADDRESS=192.168.31.67:7052
export CORE_PEER_NETWORKID=dev
# export CORE_LOGGING_LEVEL=INFO
export CORE_PEER_TLS_ENABLED=false
export CORE_PEER_PROFILE_ENABLED=true
export CORE_PEER_ADDRESS=127.0.0.1:7051
export CORE_PEER_GOSSIP_BOOTSTRAP=127.0.0.1:7051
export CORE_PEER_GOSSIP_EXTERNALENDPOINT=127.0.0.1:7051
export CORE_PEER_LISTENADDRESS=0.0.0.0:7051
# export CORE_PEER_GOSSIP_ENDPOINT=127.0.0.1:7051
# export CORE_PEER_EVENTS_ADDRESS=127.0.0.1:7053
export CORE_PEER_LOCALMSPID=Org1MSP


# export CORE_LEDGER_STATE_STATEDATABASE=goleveldb
export CORE_PEER_TLS_CERT_FILE=$(pwd)/config/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/server.crt
export CORE_PEER_TLS_KEY_FILE=$(pwd)/config/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/server.key
export CORE_PEER_TLS_ROOTCERT_FILE=$(pwd)/config/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
export CORE_PEER_TLS_ROOTCERT_FILE = $(pwd)/config/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/msp/tlscacerts/tlsca.org1.example.com-cert.pem
# export CORE_PEER_MSPCONFIGPATH=$(pwd)/config/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/msp
# export CORE_PEER_TLS_PRIVATEKEY=$(pwd)/config/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/server.key
# export CORE_PEER_TLS_CERTIFICATE=$(pwd)/config/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/server.crt
# export CORE_PEER_TLS_ROOTCAS=[$(pwd)/config/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt]
# export CORE_PEER_ROOTCAS=[$(pwd)/config/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt]

export CORE_PEER_FILESYSTEMPATH=$(pwd)/data/peer
export FABRIC_LOGGING_SPEC=INFO

peer node start  #--peer-chaincodedev=true #-o 127.0.0.1:7050