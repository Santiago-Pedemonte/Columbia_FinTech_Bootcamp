pragma solidity ^0.5.0;

contract JointSavings {
  address payable account_one = 0xc3879B456DAA348a16B6524CBC558d2CC984722c;
  address payable account_two = 0xA29f7E79ECEA4cE30DD78cfeb9605D9aFf5143a5;

  address public last_to_withdraw;
  uint public last_withdraw_block;
  uint public last_withdraw_amount;

  address public last_to_deposit;
  uint public last_deposit_block;
  uint public last_deposit_amount;

  uint unlock_time;

  uint fakenow = now;

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

    unlock_time = fakenow + 24 hours;

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
