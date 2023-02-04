// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Level04.sol";

contract SelfDestruct {
    address owner;

    constructor() public {
        owner = msg.sender;
    }

    function selfDestruct(address payable target) public onlyOwner {
        require(address(this).balance > 0, "No balance to self-destruct");
        selfdestruct(target);
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    receive() payable external {}
}