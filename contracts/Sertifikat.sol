//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Sertifikat is ERC721Enumerable, Ownable {
    string public BASE_URI;

    constructor(
        string memory baseURI,
        string memory name,
        string memory symbol
    ) ERC721(name, symbol) {
        BASE_URI = baseURI;
    }

    function _baseURI() internal view override returns (string memory) {
        return string(abi.encodePacked(BASE_URI, "/"));
    }

    function mint(address addr) 
        public
        onlyOwner
        payable
        returns (uint256)
    {
        uint256 supply = totalSupply();
        uint256 tokenId = supply + 1;       
        _safeMint(addr, tokenId);
        return tokenId;
    }
}