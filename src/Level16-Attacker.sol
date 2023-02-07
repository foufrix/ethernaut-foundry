// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract AttackerLevel16 {
    uint256 storageSlot0;
    uint256 storageSlot1;
    uint256 owner;

    function setTime(uint256 _owner) public {
        owner = _owner;
    }
}