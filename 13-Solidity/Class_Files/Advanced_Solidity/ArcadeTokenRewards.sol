pragma solidity ^0.5.0;

import "github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/math/SafeMath.sol";

contract ArcadeToken {
    using SafeMath for uint;

    address payable owner = msg.sender;
    string public symbol = "ARCD";
    uint public exchange_rate = 100;
    uint public fee_rate = 25; // represents 25 basis points, which equates to 0.25%
    uint public reward_rate = 3; // 3 tokens for every wei spent

    mapping(address => uint) balances;

    function balance() public view returns(uint) {
        return balances[msg.sender];
    }

    function transfer(address recipient, uint value) public {
        balances[msg.sender] = balances[msg.sender].sub(value);
        balances[recipient] = balances[recipient].add(value);
    }

    function purchase() public payable {
        uint amount = msg.value.mul(exchange_rate);
        balances[msg.sender] = balances[msg.sender].add(amount);
        owner.transfer(msg.value);
    }

    function mint(address recipient, uint value) public {
        require(msg.sender == owner, "You do not have permission to mint tokens!");
        balances[recipient] = balances[recipient].add(value);
    }

    function spend(address payable recipient) public payable {
        uint fee = msg.value.mul(fee_rate).div(10000); // calculate 0.25% from basis points
        uint reward = msg.value.mul(reward_rate); // reward 3 points for every wei spent

        balances[msg.sender] = balances[msg.sender].add(reward); // add reward to sender point balance

        recipient.transfer(msg.value.sub(fee)); // send transaction with fee subtracted
        owner.transfer(fee); // send fee to RewardsToken owner
    }
}
