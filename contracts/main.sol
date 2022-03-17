pragma solidity ^0.8.0;
import "./erc721.sol";
import "./token1.sol";
import "./token2.sol";

contract Token {

    t1 test1;
    t2 test2;
    // erc test2;
    testERC721 erc721;
    // constructor(address ERC,address token1,address token2){
    //     erctest=testERC721(ERC);
    //     test1=erc(token1);
    //     test2=erc(token2);
    // }
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



//steps to run this project
//1) Deploy erc contract in myerc20.sol file with token1 name,symbol, fee receiver.
//2) Repeat the step 2 to create token2.
//3) Deploy the TestERC721 contract in new3.sol file.
//4) Deploy the Token contract in new5.sol file with address of ERC721, token1, token2 contract address in constructor.
//5) Copy Token contract address and paste it in transferOwnership function of TestERC721 contract and run.
//6) Now run mintMeERC721 function of Token contract with TokenURI, Amount of test Token1, Token2. run
//7)Done!!