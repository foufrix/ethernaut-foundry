// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Level11.sol";
import "../src/Level11-Attacker.sol";

contract Level11Test is Test {
    Level11 public level11;
    Attacker public attacker;

    function setUp() public {
      // Add ether
      vm.deal(vm.addr(1), 6 ether);

      // Deploy contract, and add 1 ether into addr 1 account
      vm.startPrank(vm.addr(1));
      level11 = new Level11();
      attacker = new Attacker(address(level11));
      vm.stopPrank();
    }

    function testLevel11() public {
      vm.prank(vm.addr(1));

      //Trigger attacker, will go to a level and return true when asked if top
      attacker.attack();
      //Check if we are at top level
      assert(level11.top());
      vm.stopPrank();
    }
}
