// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Level12.sol";

contract Level12Test is Test {
    Level12 public level12;
    bytes32[3] data;

    function setUp() public {
      // Add ether
      vm.deal(vm.addr(1), 6 ether);

      // Deploy contract, and add 1 ether into addr 1 account
      vm.startPrank(vm.addr(1));
      data = [
        bytes32(0x0000000000000000000000000000000000000000000000000000000000000000),
        bytes32(0x0000000000000000000000000000000000000000000000000000000000000000),
        bytes32(0x1e56e2b6d8a72c4ce38ec4f86d0dfb4e6d4ec5e92009618503624dce7dc2efda)
      ];
      level12 = new Level12(data);
      vm.stopPrank();
    }

    function testLevel12() public {
      vm.prank(vm.addr(2));
      //TODO find a way in test to access storage locally
      vm.stopPrank();
    }
}
