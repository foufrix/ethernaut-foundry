// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/00-HelloEthernaut.sol";

contract Level0Test is Test {
    Level0 public helloEthernaut;

    function setUp() public {
        helloEthernaut = new Level0("whatever");
    }
    

    function testInfo() public {
      vm.startBroadcast();
      emit log(helloEthernaut.info());
      emit log(helloEthernaut.info1());
      emit log(helloEthernaut.info2("hello"));
      emit log_uint(helloEthernaut.infoNum());
      emit log(helloEthernaut.info42());
      emit log(helloEthernaut.theMethodName());
      emit log(helloEthernaut.method7123949());
      helloEthernaut.authenticate(helloEthernaut.password());
      vm.stopBroadcast();
    }
}
