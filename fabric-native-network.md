


cryptogen generate --config=./config/crypto-config.yaml --output=./config/crypto-config
cryptogen generate --config=./organizations/cryptogen/crypto-config-org1.yaml --output="organizations"



export FABRIC_CFG_PATH=$(pwd)/config/

configtxgen -profile SingleSoloOrdererGenesis -channelID system-channel -outputBlock ./config/genesis.block




cryptogen generate --config=./organizations/cryptogen/crypto-config-org1.yaml --output="organizations"
cryptogen generate --config=./organizations/cryptogen/crypto-config-org2.yaml --output="organizations"
cryptogen generate --config=./organizations/cryptogen/crypto-config-orderer.yaml --output="organizations"

cryptogen generate --config=./organizations/cryptogen/crypto-config-orderer.yaml --output="organizations"

configtxgen -profile TwoOrgsChannel -channelID system-channel -outputBlock ./system-genesis-block/genesis.block


configtxgen -profile TwoOrgsOrdererGenesis  -channelID system-channel -outputBlock ./channel-artifacts/genesis.block

configtxgen -profile TwoOrgsChannel -outputCreateChannelTx ./channel-artifacts/channel.tx -channelID testchannel


export rootDir=$(pwd)
export PATH=$rootDir/bin:$PATH


export RDERER_HOST=orderer.example.com
export ORDERER_GENERAL_LOGLEVEL=DEBUG
export ORDERER_GENERAL_TLS_ENABLED=true
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


export FABRIC_CFG_PATH=$(pwd)/config

orderer




export CORE_PEER_ID=example_org
export CORE_CHAINCODE_MODE=dev
export CORE_PEER_CHAINCODELISTENADDRESS=0.0.0.0:7052
export CORE_PEER_NETWORKID=dev
export CORE_LOGGING_LEVEL=INFO
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_PROFILE_ENABLED=false
export CORE_PEER_ADDRESS=0.0.0.0:7051
export CORE_PEER_LISTENADDRESS=0.0.0.0:7051
export CORE_PEER_GOSSIP_ENDPOINT=0.0.0.0:7051
export CORE_PEER_EVENTS_ADDRESS=0.0.0.0:7053
export CORE_PEER_LOCALMSPID=OrgMSP
export CORE_LEDGER_STATE_STATEDATABASE=goleveldb
export CORE_PEER_MSPCONFIGPATH=$(pwd)/config/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/msp

export CORE_PEER_TLS_PRIVATEKEY=$(pwd)/config/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/server.key
export CORE_PEER_TLS_CERTIFICATE=$(pwd)/config/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/server.crt
export CORE_PEER_TLS_ROOTCAS=[$(pwd)/config/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt]
export CORE_PEER_ROOTCAS=[$(pwd)/config/crypto-config/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt]

export CORE_PEER_FILESYSTEMPATH=$(pwd)/data/peer
export FABRIC_CFG_PATH=$(pwd)/config
export FABRIC_LOGGING_SPEC=DEBUG

peer node start -o 127.0.0.1:7050 --peer-chaincodedev=true


export CORE_PEER_ID=example_org2
export CORE_CHAINCODE_MODE=dev
export CORE_PEER_CHAINCODELISTENADDRESS=0.0.0.0:9052
export CORE_PEER_NETWORKID=dev
export CORE_LOGGING_LEVEL=INFO
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_PROFILE_ENABLED=false
export CORE_PEER_ADDRESS=0.0.0.0:9051
export CORE_PEER_LISTENADDRESS=0.0.0.0:9051
export CORE_PEER_GOSSIP_ENDPOINT=0.0.0.0:9051
export CORE_PEER_EVENTS_ADDRESS=0.0.0.0:9053
export CORE_PEER_LOCALMSPID=OrgMSP
export CORE_LEDGER_STATE_STATEDATABASE=goleveldb
export CORE_PEER_MSPCONFIGPATH=$(pwd)/config/crypto-config/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/msp

export CORE_PEER_TLS_PRIVATEKEY=$(pwd)/config/crypto-config/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/server.key
export CORE_PEER_TLS_CERTIFICATE=$(pwd)/config/crypto-config/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/server.crt
export CORE_PEER_TLS_ROOTCAS=[$(pwd)/config/crypto-config/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt]
export CORE_PEER_ROOTCAS=[$(pwd)/config/crypto-config/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt]

export CORE_PEER_FILESYSTEMPATH=$(pwd)/data/peer2
export FABRIC_CFG_PATH=$(pwd)/config
export FABRIC_LOGGING_SPEC=DEBUG








	General.ListenAddress = "0.0.0.0"
	General.ListenPort = 7050
	General.TLS.Enabled = true
	General.TLS.PrivateKey = "/Users/JC/Documents/project/jincaihuilian/fabric-samples/test-network/native-network/config/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/tls/server.key"
	General.TLS.Certificate = "/Users/JC/Documents/project/jincaihuilian/fabric-samples/test-network/native-network/config/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/tls/server.crt"
	General.TLS.RootCAs = [/Users/JC/Documents/project/jincaihuilian/fabric-samples/test-network/native-network/config/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/tls/ca.crt]
	General.TLS.ClientAuthRequired = false
	General.TLS.ClientRootCAs = []
	General.TLS.TLSHandshakeTimeShift = 0s
	General.Cluster.ListenAddress = ""
	General.Cluster.ListenPort = 0
	General.Cluster.ServerCertificate = ""
	General.Cluster.ServerPrivateKey = ""
	General.Cluster.ClientCertificate = ""
	General.Cluster.ClientPrivateKey = ""
	General.Cluster.RootCAs = []
	General.Cluster.DialTimeout = 5s
	General.Cluster.RPCTimeout = 7s
	General.Cluster.ReplicationBufferSize = 20971520
	General.Cluster.ReplicationPullTimeout = 5s
	General.Cluster.ReplicationRetryTimeout = 5s
	General.Cluster.ReplicationBackgroundRefreshInterval = 5m0s
	General.Cluster.ReplicationMaxRetries = 12
	General.Cluster.SendBufferSize = 10
	General.Cluster.CertExpirationWarningThreshold = 168h0m0s
	General.Cluster.TLSHandshakeTimeShift = 0s
	General.Keepalive.ServerMinInterval = 1m0s
	General.Keepalive.ServerInterval = 2h0m0s
	General.Keepalive.ServerTimeout = 20s
	General.ConnectionTimeout = 0s
	General.GenesisMethod = "file"
	General.GenesisFile = "/Users/JC/Documents/project/jincaihuilian/fabric-samples/test-network/native-network/channel-artifacts/genesis.block"
	General.BootstrapMethod = "file"
	General.BootstrapFile = "/Users/JC/Documents/project/jincaihuilian/fabric-samples/test-network/native-network/channel-artifacts/genesis.block"
	General.Profile.Enabled = false
	General.Profile.Address = "0.0.0.0:6060"
	General.LocalMSPDir = "/Users/JC/Documents/project/jincaihuilian/fabric-samples/test-network/native-network/config/crypto-config/ordererOrganizations/example.com/orderers/orderer.example.com/msp"
	General.LocalMSPID = "OrdererMSP"
	General.BCCSP.ProviderName = "GM"
	General.BCCSP.SwOpts.SecLevel = 256
	General.BCCSP.SwOpts.HashFamily = "GMSM3"
	General.BCCSP.SwOpts.Ephemeral = true
	General.BCCSP.SwOpts.FileKeystore.KeyStorePath = ""
	General.BCCSP.SwOpts.DummyKeystore =
	General.BCCSP.SwOpts.InmemKeystore =
	General.Authentication.TimeWindow = 15m0s
	General.Authentication.NoExpirationChecks = false
	FileLedger.Location = "/Users/JC/Documents/project/jincaihuilian/fabric-samples/test-network/native-network/data/orderer"
	FileLedger.Prefix = "hyperledger-fabric-ordererledger"
	Kafka.Retry.ShortInterval = 5s
	Kafka.Retry.ShortTotal = 10m0s
	Kafka.Retry.LongInterval = 5m0s
	Kafka.Retry.LongTotal = 12h0m0s
	Kafka.Retry.NetworkTimeouts.DialTimeout = 10s
	Kafka.Retry.NetworkTimeouts.ReadTimeout = 10s
	Kafka.Retry.NetworkTimeouts.WriteTimeout = 10s
	Kafka.Retry.Metadata.RetryMax = 3
	Kafka.Retry.Metadata.RetryBackoff = 250ms
	Kafka.Retry.Producer.RetryMax = 3
	Kafka.Retry.Producer.RetryBackoff = 100ms
	Kafka.Retry.Consumer.RetryBackoff = 2s
	Kafka.Verbose = false
	Kafka.Version = 0.10.2.0
	Kafka.TLS.Enabled = false
	Kafka.TLS.PrivateKey = ""
	Kafka.TLS.Certificate = ""
	Kafka.TLS.RootCAs = []
	Kafka.TLS.ClientAuthRequired = false
	Kafka.TLS.ClientRootCAs = []
	Kafka.TLS.TLSHandshakeTimeShift = 0s
	Kafka.SASLPlain.Enabled = false
	Kafka.SASLPlain.User = ""
	Kafka.SASLPlain.Password = ""
	Kafka.Topic.ReplicationFactor = 3
	Debug.BroadcastTraceDir = ""
	Debug.DeliverTraceDir = ""
	Consensus = map[SnapDir:/var/hyperledger/production/orderer/etcdraft/snapshot WALDir:/var/hyperledger/production/orderer/etcdraft/wal]
	Operations.ListenAddress = "127.0.0.1:8443"
	Operations.TLS.Enabled = false
	Operations.TLS.PrivateKey = ""
	Operations.TLS.Certificate = ""
	Operations.TLS.RootCAs = []
	Operations.TLS.ClientAuthRequired = false
	Operations.TLS.ClientRootCAs = []
	Operations.TLS.TLSHandshakeTimeShift = 0s
	Metrics.Provider = "disabled"
	Metrics.Statsd.Network = "udp"
	Metrics.Statsd.Address = "127.0.0.1:8125"
	Metrics.Statsd.WriteInterval = 30s
	Metrics.Statsd.Prefix = ""
	ChannelParticipation.Enabled = false
	ChannelParticipation.RemoveStorage = false
	
	
	
	
	
	
	
	
	
	
	
	
####example 1.4.2####
	
export PATH=/Users/JC/Documents/project/hyba/fabric-gm/fabric/release/darwin-amd64/bin:$PATH
	
export FABRIC_CFG_PATH=$(pwd)/config/
cryptogen generate --config=./config/crypto-config.yaml --output=./config/crypto-config

configtxgen -profile SampleSingleMSPSolo  -channelID system-channel -outputBlock ./channel-artifacts/genesis.block

configtxgen -profile TwoOrgsChannel -outputCreateChannelTx ./channel-artifacts/channel.tx -channelID testchannel


export RDERER_HOST=orderer.example.com
export ORDERER_GENERAL_LOGLEVEL=DEBUG
export ORDERER_GENERAL_TLS_ENABLED=true
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