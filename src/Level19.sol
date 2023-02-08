// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "openzeppelin-contracts/contracts/access/Ownable.sol";

//Alien-Codex
contract Level19 is Ownable {

  bool public contact;
  bytes32[] public codex;

  modifier contacted() {
    assert(contact);
    _;
  }

  function make_contact() public {
    contact = true;
  }

  function record(bytes32 _content) contacted public {
    codex.push(_content);
  }

  function retract() contacted public {
    //codex.length--; // Not possible in solidity 0.8
  }

  function revise(uint i, bytes32 _content) contacted public {
    codex[i] = _content;
  }
}