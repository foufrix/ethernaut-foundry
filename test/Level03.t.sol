// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Level03.sol";

contract Level03Test is Test {
    Level03 public level03;

    uint256 lastHash;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function setUp() public {
      vm.prank(vm.addr(1));
      level03 = new Level03();
    }

    

    function testLevel03() public {
      //10 times good coin flip
      while(level03.consecutiveWins() < 10) {
        console.log("Consecutive Wins: ", level03.consecutiveWins());
        uint256 blockValue = uint256(blockhash(block.number - 1));
        lastHash = blockValue;
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;
        bool isTrue;
        if (side) {
            isTrue = level03.flip(true);
        } else {
            isTrue = level03.flip(false);
        }

        vm.roll(block.number + 1); //need to roll because `submitTransaction` didn't actually create a new block
        if(!isTrue) {
          console.log("Bad guess, revert");
          revert();
        }
      }

      assertEq(level03.consecutiveWins(), 10);
    }
}
