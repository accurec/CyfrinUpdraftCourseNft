// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract SelectorDirectCalls {
    // This is better used in Remix for exploration and testing purposes

    address public s_someAddress;
    uint256 public s_amount;

    function transfer(address someAdress, uint256 amount) public {
        s_amount = amount;
        s_someAddress = someAdress;
    }

    function getSelectorOne() public pure returns (bytes4 selector) {
        selector = bytes4(keccak256(bytes("transfer(address,uint256)")));
    }

    function getDataToCallTransfer(address someAddress, uint256 amount) public pure returns (bytes memory) {
        return abi.encodeWithSelector(getSelectorOne(), someAddress, amount);
    }

    function callTransferWithBinary(address someAddress, uint256 amount) public returns (bytes4, bool) {
        (bool success, bytes memory returnData) = address(this).call(
            abi.encodeWithSelector(getSelectorOne(), someAddress, amount)
        );

        return (bytes4(returnData), success);
    }

    function callTransferWithBinaryTwo(address someAddress, uint256 amount) public returns (bytes4, bool) {
        (bool success, bytes memory returnData) = address(this).call(
            abi.encodeWithSignature("transfer(address,uint256)", someAddress, amount)
        );

        return (bytes4(returnData), success);
    }
}

// 0xa9059cbb, 0000000000000000000000000813d4a158d06784fdb48323344896b2b1aa0f85, 0000000000000000000000000000000000000000000000000000000000000309

// 0xa9059cbb, 2ab09eb219583f4a59a5d0623ade, 346d962bcd4e46b11da047c9049b
