echo "######orderer startup start######"
echo "current path: $(pwd)"
echo "remove data/orderer"
rm -rf ./data/orderer
export FABRIC_CFG_PATH=$(pwd)/config/
export RDERER_HOST=orderer.example.com
export ORDERER_GENERAL_LOGLEVEL=DEBUG
export ORDERER_GENERAL_TLS_ENABLED=false
export ORDERER_GENERAL_TLS_PRIVATEKEY=$(pwd)/config/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/tls/server.key
export ORDERER_GENERAL_TLS_CERTIFICATE=$(pwd)/config/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/tls/server.crt
export ORDERER_GENERAL_TLS_ROOTCAS=[$(pwd)/config/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/tls/ca.crt]
export ORDERER_GENERAL_ROOTCAS=[$(pwd)/config/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/tls/ca.crt]

export ORDERER_GENERAL_PROFILE_ENABLED=false
export ORDERER_GENERAL_LISTENADDRESS=0.0.0.0
export ORDERER_GENERAL_LISTENPORT=7050
export ORDERER_GENERAL_GENESISMETHOD=file
export ORDERER_GENERAL_GENESISFILE=$(pwd)/channel-artifacts/genesis.block

export ORDERER_GENERAL_LOCALMSPDIR=$(pwd)/config/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp
export ORDERER_GENERAL_LOCALMSPID=OrdererMSP
export ORDERER_FILELEDGER_LOCATION=$(pwd)/data/orderer

export ORDERER_GENERAL_CLUSTER_CLIENTCERTIFICATE=crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/tls/server.crt
export ORDERER_GENERAL_CLUSTER_CLIENTPRIVATEKEY=crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/tls/server.key
export ORDERER_GENERAL_CLUSTER_ROOTCAS=crypto-config/ordererOrganizations/example.com/ca/ca.example.com-cert.pem

orderer

