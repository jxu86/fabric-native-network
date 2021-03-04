echo "######generate config file start######"
echo "current path: $(pwd)"
echo "remove crypto-config"
rm -rf ./config/crypto-config

cryptogen generate --config=./config/cryptogen/crypto-config.yaml --output=./config/crypto-config
echo "remove channel-artifacts"
rm -rf ./channel-artifacts
export FABRIC_CFG_PATH=$(pwd)/config/
configtxgen -profile TwoOrgsOrdererGenesis  -channelID system-channel -outputBlock ./channel-artifacts/genesis.block
configtxgen -profile TwoOrgsChannel -outputCreateChannelTx ./channel-artifacts/mychannel.tx -channelID mychannel
configtxgen -profile TwoOrgsChannel  -outputAnchorPeersUpdate ./channel-artifacts/Org1MSPanchors.tx -channelID  mychannel -asOrg Org1MSP

echo "######generate config file over######"