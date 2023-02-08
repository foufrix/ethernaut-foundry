// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Level08.sol";
contract Level08Test is Test {

    using stdStorage for StdStorage;
    Level08 public level08;
    bytes32 public password;

    function setUp() public {
      vm.prank(vm.addr(1));
      level08 = new Level08("yolo");
    }

    function testLevel08() public {
      vm.startPrank(vm.addr(2));

      //Get the storage of the contract, private means other contract cannot access the value, but the slot is there and accessible
      password = stdstore.target(address(level08)).sig("password").read_bytes32();
      emit log_bytes32(password);
      //TODO: solve Foundry error (stdStorage find(StdStorage): No storage use detected for target.)
      assert(!level08.locked());
      vm.stopPrank();
    }
}
