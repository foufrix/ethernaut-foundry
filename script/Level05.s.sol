// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Level05.sol";

contract AttackerScript is Script {
    Level05 level05 = Level05(0x4Afd0aa3D0A97fB030403914E32668C77d076D9A);

    function run() public {
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
      // I did not want to complicate things, I used Remix for this one as I don't know how to build solidity version
      // before 0.8 with foundry
      // Steps are in test
      vm.stopBroadcast();
    }
}
