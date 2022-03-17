pragma solidity ^0.8.0;
import "./myerc20.sol";
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
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

        // ERC20(test1).approve(address(erc721),amountToken1);
        // ERC20(test1).transferFrom(msg.sender, address(erc721), amountToken1);

        // ERC20(test2).approve(address(erc721),amountToken1);
        // ERC20(test2).transferFrom(msg.sender, address(erc721), amountToken2);
        
        // require(msg.value >= 0.01 ether, "Minimum 0.01 ether need to be send to mint the token");
        erctest.mint(address(this),msg.sender,tokenURI);
        
    }
}

