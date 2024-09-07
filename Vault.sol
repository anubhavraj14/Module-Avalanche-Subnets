// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./ERC20.sol"; 

contract Vault {
    address public owner;
    mapping(address => uint256) public balances;

    ERC20 public token; 

    event Deposit(address indexed player, uint256 amount);
    event Withdrawal(address indexed player, uint256 amount);

    constructor(address _tokenAddress) {
        owner = msg.sender;
        token = ERC20(_tokenAddress); 
    }

    function deposit(uint256 _amount) external {
        require(_amount > 0, "Amount must be greater than 0");
        
   
        token.transferFrom(msg.sender, address(this), _amount);
        
       
        balances[msg.sender] += _amount;
        
        emit Deposit(msg.sender, _amount);
    }

    function withdraw(uint256 _amount) external {
        require(balances[msg.sender] >= _amount, "Insufficient balance");
        
        
        balances[msg.sender] -= _amount;
        
        token.transfer(msg.sender, _amount);
        
        emit Withdrawal(msg.sender, _amount);
    }

    function getBalance(address _player) external view returns (uint256) {
        return balances[_player];
    }

    // Owner function to withdraw any remaining tokens in the contract (if necessary)
    function withdrawTokens(address _token, uint256 _amount) external {
        require(msg.sender == owner, "Only owner can call this function");
        ERC20(_token).transfer(owner, _amount);
    }
}
