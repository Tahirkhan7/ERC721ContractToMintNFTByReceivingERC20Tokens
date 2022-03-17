pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Counters.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract testERC721 is ERC721URIStorage, Ownable{

    using Counters for Counters.Counter; 
    Counters.Counter private _tokenIds;

    constructor() ERC721("Robot NFT", "ROB") {
    }

    function mint(address contractt,address received,string memory tokenURI) public returns (uint) {
        require(owner()==contractt,"First caller need to be the owner of this ERC721 Contract!");
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();

        _mint(received, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}