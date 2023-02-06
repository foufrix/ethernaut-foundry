// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Level10.sol";
import "../src/ReentrancyAttacker.sol";

contract Level10Test is Test {
    Level10 public level10;
    ReentrancyAttacker public attacker;

    function setUp() public {
      // Add ether to 2 addr
      vm.deal(vm.addr(1), 6 ether);
      vm.deal(vm.addr(2), 6 ether);

      // Deploy contract, and add 1 ether into addr 1 account
      vm.startPrank(vm.addr(1));
      level10 = new Level10();
      level10.donate{ value: 1 ether }(vm.addr(1));
      vm.stopPrank();
    }

    function testLevel10() public {
      vm.startPrank(vm.addr(2));

      //Check that the contract has money in it
      assert(address(level10).balance > 0);

      //Deploy Reentrancy attacker, then call it
      //TODO: Understand why over/under flow errors
      attacker = new ReentrancyAttacker(address(level10));
      attacker.attack{value: 0.23 ether}();

      //Check if contract is effectively empty
      assert(address(level10).balance == 0);
      vm.stopPrank();
    }
}
