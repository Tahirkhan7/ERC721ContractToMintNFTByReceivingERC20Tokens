const { expect } = require("chai");

describe("Token Contract", function () {
  let Token;
  let token1;
  let token2;
  let erc721;
  let t1;
  let t2;
  let nft;
  let tok1;
  let tok2;
  let ERC721nft;
  let mn;
  let m;

  beforeEach(async function () {
    Token = await ethers.getContractFactory("Token");
    token1 = await ethers.getContractFactory("t1");
    token2 = await ethers.getContractFactory("t2");
    erc721 = await ethers.getContractFactory("testERC721");
    tok1 = await token1.deploy();
    tok2 = await token2.deploy();
    ERC721nft = await erc721.deploy();
    t1= tok1.address;
    t2= tok2.address;
    nft= ERC721nft.address;

    mn = await Token.deploy(t1,t2,nft);
    m= mn.address;
    [Token, token1, token2, erc721] = await ethers.getSigners();
  });



  describe("Transactions", function () {
    it("Should fail if sender does not have atleast 100 test1 tokens.", async function () {
      //owner account to token1.address
      const approved= await tok1.approve(m,100000000);
      const ownerToken1 = await tok1.transferOwnership(m);
      const approved2= await tok2.approve(m,100000000);
      const ownerToken2 = await tok2.transferOwnership(m);
      const ownerToken3 = await ERC721nft.transferOwnership(m);
      await mn.mintMeERC721("tk",100,200);

    });

    it("Should fail if sender does not have atleast 200 test2 tokens.", async function () {
        //owner account to token1.address
        const approved= await tok1.approve(m,100000000);
        const ownerToken1 = await tok1.transferOwnership(m);
        const approved2= await tok2.approve(m,100000000);
        const ownerToken2 = await tok2.transferOwnership(m);
        const ownerToken3 = await ERC721nft.transferOwnership(m);
        await mn.mintMeERC721("tk",100,200);
  
      });

      it("Should fail if caller is not the owner of the contract.", async function () {
        //owner account to token1.address
        const ownerToken1 = await tok2.transferOwnership(m);
  
      });

      it("Should fail if caller didn't get approved to transfer tokens into its.", async function () {
        //owner account to token1.address
        await expect(  tok1.approve(m,10000000)
        ).to.be.revertedWith("Not enough tokens");;
  
      });

  });
});
