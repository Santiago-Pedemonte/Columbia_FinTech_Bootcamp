pragma solidity ^0.5.0;

// lvl 1: equal split
contract AssociateProfitSplitter {
    
    address payable public employee_one;
    address payable public employee_two;
    address payable public employee_three;
    
    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {

        uint amount = msg.value / 3; // Your code here!

        employee_one.transfer(amount);
        employee_two.transfer(amount);
        employee_three.transfer(amount);

        msg.sender.transfer(msg.value - (amount * 3));
    }

    function() external payable {
        deposit();
    }
}

// Original deploy address: 0xb41c89BfB257fD5909Eb8FAe8D5fC3C02E4c6592