pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract t2 is ERC20, Ownable {
    uint256 initialSupply=1000000000000000000000;
    constructor() ERC20("test2", "t2") public {
        _mint(msg.sender, initialSupply);
    }

    function mintToken2(address contractt, uint amount) public returns (uint) {
        require(owner()==contractt,"First caller need to be the owner of this ERC20 Contract!");
        _mint(contractt, amount);
    }
}