pragma solidity ^0.5.0;

contract CustomerSavings {
  
  function withdraw(uint amount, address payable recipient) public {
    return recipient.transfer(amount);
  }

  function deposit() public payable {}

  function() external payable {}
}
