pragma solidity ^0.8.0;
import "./token1.sol";
import "./token2.sol";

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Counters.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";


contract Token is ERC721URIStorage, Ownable{

    t1 test1;
    t2 test2;


constructor(address token1,address token2,address erctest) ERC721("Robot NFT", "ROB"){
        test1=t1(token1);
        test2=t2(token2);
    }

    function mintMeERC721(string memory tokenURI,uint amountToken1, uint amountToken2)  public returns (uint){
        require(amountToken1>=100,"Test1 Token need to be greater than or equals to 100!");
        require(amountToken2>=200,"Test1 Token need to be greater than or equals to 200!");
        require(
            test1.allowance(msg.sender, address(this)) >= amountToken1,
            "Token 1 allowance should be greater than equals to 100"
        );
        require(
            test1.allowance(msg.sender, address(this)) >= amountToken2,
            "Token 2 allowance should be greater than equals to 200"
        );
        bool sent1=ERC20(test1).transferFrom(msg.sender, address(this), amountToken1);
        require(sent1,"Token 1 transfer failed!");
        bool sent2=ERC20(test2).transferFrom(msg.sender, address(this), amountToken2);
        require(sent2, "Token 2 transfer failed");
        
        
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();

        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}
