// SPDX-License-Identifier: MIT
//pragma solidity ^0.6.12;
//import 'openzeppelin-contracts-06/math/SafeMath.sol';
// Commented for sake of simplicity

pragma solidity ^0.8.13;
import "openzeppelin-contracts/contracts/utils/math/SafeMath.sol";
// Test will give underflow error because of 0.8, but working onchain with script

contract Level10 {

  using SafeMath for uint256;
  mapping(address => uint) public balances;

  function donate(address _to) public payable {
    balances[_to] = balances[_to].add(msg.value);
  }

  function balanceOf(address _who) public view returns (uint balance) {
    return balances[_who];
  }

  function withdraw(uint _amount) public {
    if(balances[msg.sender] >= _amount) {
      (bool result,) = msg.sender.call{value:_amount}("");
      if(result) {
        _amount;
      }
      balances[msg.sender] -= _amount;
    }
  }

  receive() external payable {}
}