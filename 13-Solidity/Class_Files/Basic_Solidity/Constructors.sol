pragma solidity ^0.5.11;

contract JointSavings {
  address payable account_one;
  address payable account_two;

  address public last_to_withdraw;
  uint public last_withdraw_block;
  uint public last_withdraw_amount;

  address public last_to_deposit;
  uint public last_deposit_block;
  uint public last_deposit_amount;

  uint unlock_time;

  uint fakenow = now;

  constructor(address payable _one, address payable _two) public {
    account_one = _one;
    account_two = _two;
  }

  function fastforward() public {
    fakenow += 100 days;
  }

  function withdraw(uint amount) public {
    require(unlock_time < fakenow, "Account is locked!");
    require(msg.sender == account_one || msg.sender == account_two, "You don't own this account!");

    if (last_to_withdraw != msg.sender) {
      last_to_withdraw = msg.sender;
    }

    last_withdraw_block = block.number;
    last_withdraw_amount = amount;

    if (amount > address(this).balance / 3) {
      unlock_time = fakenow + 24 hours;
    }

    msg.sender.transfer(amount);
  }

  function deposit() public payable {

    if (last_to_deposit != msg.sender) {
      last_to_deposit = msg.sender;
    }

    last_deposit_block = block.number;
    last_deposit_amount = msg.value;
  }

  function() external payable {}
}
