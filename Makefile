-include .env

deploy-local:
	forge script script/DeployBasicNft.s.sol --rpc-url $(LOCAL_RPC_URL) --account $(LOCAL_ACCOUNT) --broadcast

mint-local:
	forge script script/Interactions.s.sol:MintBasicNft --rpc-url $(LOCAL_RPC_URL) --account $(LOCAL_ACCOUNT) --broadcast

deploy-sepolia:
	forge script script/DeployBasicNft.s.sol --rpc-url $(SEPOLIA_RPC_URL) --account $(SEPOLIA_ACCOUNT) --broadcast

deploy-mood-local:
	forge script script/DeployMoodNft.s.sol --rpc-url $(LOCAL_RPC_URL) --account $(LOCAL_ACCOUNT) --broadcast

mint-mood-local:
	forge script script/InteractionsMood.s.sol:MintMoodNft --rpc-url $(LOCAL_RPC_URL) --account $(LOCAL_ACCOUNT) --broadcast
