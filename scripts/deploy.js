   
async function main() {
    const [deployer] = await ethers.getSigners();
  
    const token1 = await ethers.getContractFactory("t1");
    const token2 = await ethers.getContractFactory("t2");
    const erc721 = await ethers.getContractFactory("testERC721");
    const main = await ethers.getContractFactory("Token");
    const tok1 = await token1.deploy();
    const tok2 = await token2.deploy();
    const ERC721nft = await erc721.deploy();
    const t1= tok1.address;
    const t2= tok2.address;
    const nft= ERC721nft.address;

    const mn = await main.deploy(t1,t2,nft);
    const m= mn.address;
    const ownerToken1 = await tok1.transferOwnership(m);
    const ownerToken2 = await tok2.transferOwnership(m);
    const ownerERC721 = await ERC721nft.transferOwnership(m);

    console.log("Test 1 token is deployed to:", t1);
    console.log("Test 2 token is deployed to:", t2);
    console.log("Robot NFT ERC721 contract is deployed to:", nft);
    console.log("Main contract is deployed to:", m);
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });