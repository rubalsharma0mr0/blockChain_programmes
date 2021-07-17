pragma solidity ^0.8.6;

contract penny{
    address public minter;
    mapping (address => uint) public balances;
    
    event Sent(address from, address to, uint amount);
    
    constructor() {
        minter = msg.sender;
    }
    
    function mint (address receiver, uint amount) public{
        if(msg.sender != minter) return;
        balances[receiver] += amount;
    }
    
    function send (address receiver, uint amount) public{
        
        if(balances[msg.sender]<amount)return;
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender,receiver, amount);
    }
    
    
}
