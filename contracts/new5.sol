pragma solidity ^0.8.0;
import "./myerc20.sol";
import "./new3.sol";


contract Token {

    erc test1;
    erc test2;
    testERC721 erctest;
    constructor(address ERC,address token1,address token2){
        erctest=testERC721(ERC);
        test1=erc(token1);
        test2=erc(token2);
    }


    function mintMeERC721(string memory tokenURI,uint amountToken1,uint amountToken2) payable public {

        require(amountToken1>=100,"Test1 Token need to be greater than or equals to 100!");
        require(amountToken2>=200,"Test1 Token need to be greater than or equals to 200!");
        test1.mint(msg.sender,amountToken1);
        test2.mint(msg.sender,amountToken2);

        erctest.mint(address(this),msg.sender,tokenURI);
        
    }
}

