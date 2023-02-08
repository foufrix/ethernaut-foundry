// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Level05.sol";

contract Level05Test is Test {
    Level05 public level05;

    function setUp() public {
      vm.prank(vm.addr(1));
      level05 = new Level05(20);
    }

    function testLevel05() public {
      vm.startPrank(vm.addr(2));
      // There is no underflow check, so you can send more token than what you have
      // Use another account to send you more, but less than 2^256 _20 otherwise you overflow your own account
      level05.transfer(vm.addr(1), 50);
      assertEq(level05.balanceOf(vm.addr(1)), 70);
    }
}
