// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {MoodNft} from "src/MoodNft.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract MintMoodNft is Script {
    function run() external {
        address mostRecentDeployment = DevOpsTools.get_most_recent_deployment("MoodNft", block.chainid);
        mintNftOnContract(mostRecentDeployment);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        MoodNft(contractAddress).mintNft();
        vm.stopBroadcast();
    }
}
