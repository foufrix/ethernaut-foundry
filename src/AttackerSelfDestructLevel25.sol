// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract SelfDestruct {

    function selfDestruct() public {
        selfdestruct(address(0));
    }
}