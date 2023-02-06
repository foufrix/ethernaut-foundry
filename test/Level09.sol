// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Level09.sol";
import "../src/Level09-Attacker.sol";

contract Level09Test is Test {
    Level09 public level09;
    Level09Attacker public attacker;

    function setUp() public {
      // Initialize account with Ether
      vm.deal(vm.addr(1), 6 ether);
      vm.deal(vm.addr(2), 6 ether);

      // Deploy king
      vm.prank(vm.addr(1));
      level09 = new Level09{value: 1 ether}();

      // Deploy attacker
      vm.prank(vm.addr(2));
      attacker = new Level09Attacker(payable(address(level09)));
    }

    function testLevel09() public {
      vm.prank(vm.addr(2));
      (bool AttackSuccess ) = attacker.attack{value: 2 ether}();
      assert(AttackSuccess);

      // Try to take the thrown back, contract should be locked
      vm.prank(vm.addr(1));
      (bool success, ) = payable(address(level09)).call{value: 3 ether}("");
      assert(!success);
    }
}
