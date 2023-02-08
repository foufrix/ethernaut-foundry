// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Level20.sol";
import "../src/Level20-Attacker.sol";

contract Level20Test is Test {
    Level20 public level20;
    Level20Attacker public attacker;

    function setUp() public {
      // Add ether
      vm.deal(vm.addr(1), 6 ether);

      //Deploy contract
      vm.startPrank(vm.addr(1));
      level20 = new Level20();
      vm.stopPrank();

    }

    //TODO: find a way to compile into sol 0.5 with foundry, script working because Interface ok.

    function testLevel20() public {
      assertEq(vm.addr(1), level20.owner());

      vm.startPrank(vm.addr(2));
      attacker = new Level20Attacker();
      level20.setWithdrawPartner(address(attacker));
      vm.stopPrank();

      //Withdraw should not work
      vm.prank(vm.addr(1));
      vm.expectRevert();
      level20.withdraw{gas : 10000 wei}();
    }
}
