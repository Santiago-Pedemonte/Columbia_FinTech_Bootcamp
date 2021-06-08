pragma solidity ^0.5.0;


contract PersonalSavings {
  address payable public public_savings = 0x77B2aD074a1aF1AF2a408E3D48465E5F9ec75f45;
  address payable private_savings = 0x873Ad450656C46cb564eaf418472A1c77d7327Ad;
  string account_holder = "Jane Doe";

  address last_to_withdraw;
  uint last_withdraw_block;
  uint last_withdraw_amount;

  address last_to_deposit;
  uint last_deposit_block;
  uint last_deposit_amount;

  function withdraw(uint amount) public {
    require(msg.sender == public_savings || msg.sender == private_savings, "This is not your account");
    require(address(this).balance >= amount, "You don't have enough funds!");
    if (last_to_withdraw != msg.sender) {
      last_to_withdraw = msg.sender;
    }
    last_withdraw_block = block.number;
    last_withdraw_amount = amount;

    return msg.sender.transfer(amount);
  }

  function deposit() public payable {
    if (last_to_deposit != msg.sender) {
      last_to_deposit = msg.sender;
    }

    last_deposit_block = block.number;
    last_deposit_amount = msg.value;
  }

  function() external payable {
  }
}
