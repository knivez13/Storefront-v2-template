//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4; // <-------- Require the same Solidity COmpiler from our hardhat config file

// we will bring in the openzeppelin ERC721 NFT functionality 

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol';
import '@openzeppelin/contracts/utils/Counters.sol'; // <----- For Safemath to makes smart contract robust and safer

contract MynthNFT is ERC721URIStorage { // <----- erc721URIStorage inherits from ERC721, multiple inheritance
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    // counters allow us to keep track of tokenIds

    // address of marketplace for NFTs to interact
    address contractAddress;

    // OBJ: give the NFT market the ability to transact with tokens or change ownership
    // setApprovalForAll allows us to do that with contract address 

    // constructor set up our address
    constructor(address marketplaceAddress) ERC721('Mynthchain', 'MYNTH') { // <------- ERC721 = Mynthchain => marketplace address, Token Name = MYNTH
        contractAddress = marketplaceAddress;
    }

    function mintToken(string memory tokenURI) public returns(uint) {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _mint(msg.sender, newItemId);
        // set the token URI: id and url
        _setTokenURI(newItemId, tokenURI);
        // give the marketplace the approval to transact between users
        setApprovalForAll(contractAddress, true);
        // mint the token and set it for sale - return the id to do so 
        return newItemId;
    }
}