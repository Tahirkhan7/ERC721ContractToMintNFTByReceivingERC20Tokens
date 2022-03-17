pragma solidity ^0.8.0;
import "./erc721.sol";
import "./token1.sol";
import "./token2.sol";

contract Token {

    t1 test1;
    t2 test2;

    testERC721 erc721;

constructor(address token1,address token2,address erctest){
        test1=t1(token1);
        test2=t2(token2);
        erc721=testERC721(erctest);
    }

    function mintMeERC721(string memory tokenURI)  public {
        erc721.sendERC721(address(this),msg.sender,tokenURI);
    }

    function mintMeToken1(uint amountToken1) public {

        require(amountToken1>=100,"Test1 Token need to be greater than or equals to 100!");
        test1.mintToken1(address(this),amountToken1);
        
    }

    function mintMeToken2(uint amountToken2) public {

        require(amountToken2>=200,"Test 2 Token need to be greater than or equals to 200!");
        test2.mintToken2(address(this),amountToken2);
        
    }
}


