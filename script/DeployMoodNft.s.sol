// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {MoodNft} from "src/MoodNft.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNft is Script {
    function run() external returns (MoodNft) {
        string memory sadSvgEncoded = svgToImageURI(vm.readFile("img/sad.svg"));
        string memory happySvgEncoded = svgToImageURI(vm.readFile("img/happy.svg"));

        vm.startBroadcast();
        MoodNft nft = new MoodNft(sadSvgEncoded, happySvgEncoded);
        vm.stopBroadcast();

        return nft;
    }

    function svgToImageURI(string memory svg) public pure returns (string memory) {
        string memory baseURI = "data:image/svg+xml;base64,";
        string memory svgBase64Encoded = Base64.encode(bytes(string(abi.encodePacked(svg))));

        return string(abi.encodePacked(baseURI, svgBase64Encoded));
    }
}
