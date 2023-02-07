// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Level13.sol";
import "../src/Level13-Attacker.sol";

contract Level13Test is Test {
    Level13 public level13;
    AttackerLevel13 public attacker;

    function setUp() public {
      // Add ether
      vm.deal(vm.addr(1), 6 ether);

      //Deploy contract
      vm.startPrank(vm.addr(1));
      level13 = new Level13();
      attacker = new AttackerLevel13(address(level13));
      vm.stopPrank();

    }

    function testLevel13() public {
      vm.prank(vm.addr(2));
      console.log(vm.addr(2));
      console.log(uint32(uint64(7992)));
      console.log(uint16(uint160(tx.origin)));
      //TODO: make this work
      bytes8 key = bytes8(0x7a215E218DcCD6cF) & 0xFFFFFFFF0000FFFF;
      attacker.attack(bytes8(0x7a215E218DcCD6cF));
      vm.stopPrank();
    }
}
