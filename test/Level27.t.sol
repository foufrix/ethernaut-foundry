// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Level27.sol";
import "../src/Level27-Attacker.sol";

contract Level27Test is Test {
    GoodSamaritan public goodSamaritan;
    Coin public coin;
    Wallet public wallet;
    Level27Attacker public attacker;

    function setUp() public {
      //Deploy contract
      vm.startPrank(vm.addr(1));
      wallet = new Wallet();
      coin = new Coin(address(wallet));
      goodSamaritan = new GoodSamaritan();
      vm.stopPrank();
    }

    function testLevel27() public {
      vm.startPrank(vm.addr(2));
      attacker = new Level27Attacker(address(goodSamaritan));
      attacker.attack();
      assert(coin.balances(address(wallet)) == 0);
      vm.stopPrank();
    }
}
