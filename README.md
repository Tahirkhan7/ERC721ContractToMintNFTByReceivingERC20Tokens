ERC721 Contract To Mint NFT By Receiving ERC20 Tokens.

Steps to run this project:-

1) Deploy erc contract in myerc20.sol file with token1 name,symbol, fee receiver.

2) Repeat the step 2 to create token2.

3) Deploy the TestERC721 contract in new3.sol file.

4) Deploy the Token contract in new5.sol file with address of ERC721, token1, token2 contract address in constructor.

5) Copy Token contract address and paste it in transferOwnership function of TestERC721 contract and run.

6) Now run mintMeERC721 function of Token contract with TokenURI, Amount of test Token1, Token2.

7) Done!!
