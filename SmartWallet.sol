// SPDX-License-Identifier: MIT
// 0xd512986f6fbc62bf295e8529445fbff79eedb713

pragma solidity ^0.8.0;

contract SmartWallet {
    mapping(address => uint256) private _balances; //creer un compte qui correspondra à l'adresse du deposant => ses fonds
    
    
    function BalanceOf(address account) public view returns (uint256) { // fonction pour pouvoir voir ses fonds déposer
        return _balances[account];
    }
    
    function Deposit() public payable { // fonction de depot de fonds dans _balances[msg.sender]
        _balances[msg.sender] += msg.value;
    }
    
    function Withdraw(uint256 wdamount) public payable {
         require(_balances[msg.sender] > msg.value, "SmartWallet: can not withdraw 0 ether");
         uint256 amount = wdamount;
        _balances[msg.sender] -= wdamount;
        payable(msg.sender).transfer(amount);
    }
    
    function AmountTransfer(address account, uint256 amount) public {
        require(_balances[msg.sender] > amount, "SmartWallet: can not transfer 0 ether");
        //uint256 trstAmount = amount;
        _balances[msg.sender] -= amount;
        //payable (account).transfer(trstAmount);
        _balances[account] += amount;
    }
    
    
    function WithdrawAll() public { // fonction qui retire la totalité des fonds 
        require(_balances[msg.sender] > 0, "SmartWallet: can not withdraw 0 ether");
        uint256 amount = _balances[msg.sender];
        _balances[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }
    
    function total() public view returns(uint256) { // affiche le total des fond déposer
        return address(this).balance;
    }
    
    
}