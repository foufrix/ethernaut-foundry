// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Level00.sol";

contract Level00Test is Test {
    Level00 public level00;

    function setUp() public {
        level00 = new Level00("whatever");
    }


    function testInfo() public {
      vm.startBroadcast();
      emit log(level00.info());
      emit log(level00.info1());
      emit log(level00.info2("hello"));
      emit log_uint(level00.infoNum());
      emit log(level00.info42());
      emit log(level00.theMethodName());
      emit log(level00.method7123949());
      level00.authenticate(level00.password());
      vm.stopBroadcast();
    }
}
