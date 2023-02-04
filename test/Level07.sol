// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Level07.sol";
import "../src/AttackerSelfDestruct.sol";


contract Level07Test is Test {
    Level07 public level07;
    SelfDestruct public attacker;

    function setUp() public {
      vm.prank(vm.addr(1));
      level07 = new Level07();
    }

    function testLevel07() public {
      vm.startPrank(vm.addr(2));
      vm.deal(vm.addr(2), 2 ether);
      attacker = new SelfDestruct();
      (bool success, ) = address(attacker).call{value: 1 ether}("");
      assert(success);
      attacker.selfDestruct(payable(address(level07)));
      assert(address(level07).balance > 0);
      console.log('address(level07).balance: ', address(level07).balance);
      vm.stopPrank();
    }
}
