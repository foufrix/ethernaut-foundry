// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Level13 {

  address public entrant;
  event GasLeft(uint256 gasRemaining);

  modifier gateOne() {
    require(msg.sender != tx.origin, "invalid gateOne");
    _;
  }

  modifier gateTwo() {
    //emit GasLeft(gasleft()); // use to determine how much gas we will have on this call
    // to arrive here we consume 268, we need to have 8191 + 268 = 8459
    require(gasleft() % 8191 == 0, "invalid gateTwo");
    _;
  }

  modifier gateThree(bytes8 _gateKey) {
      require(uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)), "GatekeeperOne: invalid gateThree part one");
      require(uint32(uint64(_gateKey)) != uint64(_gateKey), "GatekeeperOne: invalid gateThree part two");
      require(uint32(uint64(_gateKey)) == uint16(uint160(tx.origin)), "GatekeeperOne: invalid gateThree part three");
    _;
  }

  function enter(bytes8 _gateKey) public gateOne gateTwo gateThree(_gateKey) returns (bool) {
    entrant = tx.origin;
    return true;
  }
}