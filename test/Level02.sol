// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Level02.sol";

contract Level02Test is Test {
    Level02 public level02;

    function setUp() public {
      vm.prank(vm.addr(1));
      level02 = new Level02();
    }

    function testLevel02() public {
      //Claim ownership
      vm.prank(vm.addr(2));
      level02.Fal1out();
    }
}
