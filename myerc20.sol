//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
contract erc 
{
    string private _name;
    string private _symbol;
    uint8 private _decimals;
    address admin;

    mapping(address => uint) balance;
    mapping(address => mapping(address => uint)) allowed;
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    uint totalSupply_ = 0 wei;
 
constructor(string memory name, string memory symbol, uint8 decimals, address payable feeReceiver, address tokenOwnerAddress) public payable {
      _name = name;
      _symbol = symbol;
      _decimals = decimals;
        balance[msg.sender] = totalSupply_;
        admin = msg.sender;
    }
    modifier onlyAdmin() {
        require(msg.sender == admin, "only Admin can run this function!!");
        _;
    }
    function totalSupply() public  view returns(uint){
        return totalSupply_;
    }
    function balanceOf(address tokenOwner) public  view returns(uint){
        return balance[tokenOwner];
    }
    function transfer(address reciever ,  uint numTokens) public  returns(bool){
        require(balance[msg.sender] >= numTokens);
        balance[msg.sender] -= numTokens;
        balance[reciever] += numTokens;
        // emit Transfer(msg.sender, reciever, numTokens);
        return true;
    }
    
    function mint(address reciever, uint quantity) public  returns(uint){
        
        balance[reciever] += quantity;
        totalSupply_ += quantity;
        return totalSupply_;
    }
    function approve(address spender_, uint value_) public onlyAdmin returns(bool success){
        allowed[msg.sender][spender_] = value_;
        // emit Approval(msg.sender, spender_, value_);
        return true;
    }
    function allowance(address ownwer_, address spender_) public onlyAdmin view returns(uint remaining){
        return allowed[ownwer_][spender_];
    }
    function transferOwnership(address newOwner) public onlyAdmin {
        require(newOwner != address(0));
        emit OwnershipTransferred(admin, newOwner);
        admin = newOwner;
    }
    function transferFrom(address _from, address _to, uint value_) public returns(bool success)
    {
        uint allowance1 = allowed[_from][msg.sender];
        require(balance[_from] >= value_ && allowance1 >= value_);
        balance[_to] += value_;
        balance[_from] -= value_;
        allowed[_from][msg.sender] -= value_;
        
        // emit Transfer(_from, _to, value_);
        return true;
    }
    function increaseAllowance(address spender_, uint256 addedValue) public onlyAdmin returns (bool) {
       approve(spender_, allowed[msg.sender][spender_] + addedValue);
       return true;
    }
    
    function decreaseAllowance(address spender_, uint subtractedValue) public onlyAdmin returns(bool)
    {
        approve(spender_, allowed[msg.sender][spender_] - subtractedValue );
        return true;
    }
    
}