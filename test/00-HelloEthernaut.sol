// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/00-HelloEthernaut.sol";

contract CounterTest is Test {
    //HelloEthernaut public helloEthernaut;
    Level0 helloEthernaut = Level0(0xcA795B3961748aef7e2EFC4C997813839797D77D);

    // function setUp() public {
    //     helloEthernaut = new Level0("whatever");
    // }
    

    function testInfo() public {
      vm.startBroadcast();
      helloEthernaut.info();
      helloEthernaut.info1();
      helloEthernaut.info2("hello");
      helloEthernaut.infoNum();
      helloEthernaut.info42();
      helloEthernaut.theMethodName();
      helloEthernaut.theMethodName();
      helloEthernaut.authenticate(helloEthernaut.password());
      vm.stopBroadcast();
    }
}
