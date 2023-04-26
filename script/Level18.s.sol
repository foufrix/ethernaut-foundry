// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Level18.sol";

contract AttackerScript is Script {
    Level18 level18 = Level18(0x1d5486cbC29b69D80d33548B381FeBB27Bb8487E);

    function run() public {
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
      bytes memory code = "\x60\x0a\x60\x0c\x60\x00\x39\x60\x0a\x60\x00\xf3\x60\x2a\x60\x80\x52\x60\x20\x60\x80\xf3";
      address solver;

      assembly {
          solver := create(0, add(code, 0x20), mload(code))
      }
      level18.setSolver(solver);
      vm.stopBroadcast();
    }
}
