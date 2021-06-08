pragma solidity ^0.5.0;

import "github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/math/SafeMath.sol";

contract ArtTokenVulnerable {
    using SafeMath for uint;

    address payable owner = msg.sender;
    string public symbol = "ART";
    uint public exchange_rate = 100;

    mapping(address => uint) balances;

    function balance() public view returns(uint) {
        return balances[msg.sender];
    }

    function transfer(address recipient, uint value) public {
        balances[msg.sender] = balances[msg.sender].sub(value);
        balances[recipient] = balances[recipient].add(value);
    }

    function purchase() public payable {
        uint amount = msg.value * exchange_rate;
        balances[msg.sender] += amount;
        owner.transfer(msg.value);
    }

    function mint(address recipient, uint value) public {
        require(msg.sender == owner, "You do not have permission to mint tokens!");
        balances[recipient] += value;
    }

    function withdrawBalance() public{
        // to protect against re-entrancy, the state variable
        // has to be change before the call
        uint amount = balances[msg.sender];
        balances[msg.sender] = 0;
        // because call.value returns a tuple, we need to save the boolean return value only
        (bool success, ) = msg.sender.call.value(amount)("");
        if( ! success ){
            revert();
        }
    }
}
