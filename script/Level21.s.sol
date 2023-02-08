// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Level21.sol";
import "../src/Level21-Attacker.sol";

contract AttackerScript is Script {
    Level21 level21 = Level21(0xD7bd97Ef100eAAfE7F4788e206E70A425bF673E8);
    Level21Attacker attacker;

    function run() public {
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
      attacker = new Level21Attacker(address(level21));
      attacker.attack();
      console.log(level21.price());
      vm.stopBroadcast();
    }
}
