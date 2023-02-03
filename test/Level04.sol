// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Level04.sol";

contract Level04Test is Test {
    Level04 public level04;

    function setUp() public {
      vm.prank(vm.addr(1));
      level04 = new Level04();
    }

    function testLevel04() public {
      //Claim Ownership
      console.log("adresse 1", vm.addr(1));
      console.log("owner", level04.owner());
      vm.startPrank(vm.addr(2));
      // Working because foundry make all test call from a master contract, to have all cheats
      level04.changeOwner(vm.addr(2));
      console.log("adresse 2", vm.addr(2));
      console.log("owner", level04.owner());
      //Veirfiy from where call are made in foundry
      console.log("sender", msg.sender); // different than vm.addr(2)

    }
}
