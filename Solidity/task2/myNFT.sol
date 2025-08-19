// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyNFT is ERC721URIStorage, Ownable{
    uint256 private tokenCounter;
    constructor() ERC721("MFT", "MFT") Ownable(msg.sender) {
        tokenCounter = 0;
    }

    function mintNFT(address _account, string memory _tokenURI) external returns(uint256) {
        uint256 tokenId = tokenCounter;
        tokenCounter++;
        _safeMint(_account, tokenId);
        _setTokenURI(tokenId, _tokenURI);

        return tokenId;
    }
}