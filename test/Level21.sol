// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Level21.sol";
import "../src/Level21-Attacker.sol";

contract Level21Test is Test {
    Level21 public level21;
    Level21Attacker public attacker;

    function setUp() public {
      // Add ether
      vm.deal(vm.addr(1), 6 ether);

      //Deploy contract
      vm.startPrank(vm.addr(1));
      level21 = new Level21();
      vm.stopPrank();

    }

    //TODO: find a way to compile into sol 0.5 with foundry, script working because Interface ok.

    function testLevel21() public {
      vm.startPrank(vm.addr(2));
      attacker = new Level21Attacker(address(level21));
      attacker.attack();
      assert(level21.price() < 100);
      vm.stopPrank();
    }
}
