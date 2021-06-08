pragma solidity ^0.5.0;

contract DayTradingAccount {

  // Initializes a payable address variable for the contract owner
  address payable public owner;

  // Initializes a uint timelock variable
  uint public  unlock_time;

  // Constructor for setting the owner of the contract as the one who deploys the contract
  constructor() public {
      owner = msg.sender;
  }

  // Obtains the balance residing within the contract
  function getBalance() public view returns(uint) {
      return address(this).balance;
  }

  // Withdraws the balance to a specified recipient
  function withdraw(address payable recipient, uint amount) public {
      require(recipient == owner, "You are not the owner of this account. Permission denied.");
      require(unlock_time < now, "You need to wait at least 24 hours from the last withdrawal before making another one.");
      require(address(this).balance - amount > 25000, "Withdrawing this amount would put you below the day trading threshold of 25,000 wei.");

      unlock_time = now + 24 hours;
      return recipient.transfer(amount);
  }

  // Makes a deposit to the contract
  function deposit() public payable {
      require(msg.value > 25000, "You need at least 25,000 wei to day trade!");
  }

  // Fallback function
  function() external payable {
  }

}