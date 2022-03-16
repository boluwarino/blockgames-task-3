//contracts/MyNFT.sol
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Counters.sol";

contract NoobNFT is ERC721 {
    
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    struct Metadata {
        string name;
        string image;
        string description;
    }

    mapping (uint256 => Metadata) metadata;

    constructor() ERC721("NoobNFT", "NOOB") {

    }

    function createItem(address _tokenOwner, string memory _name, string memory _image, string memory _description) public returns (uint256) {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        metadata[newItemId] = Metadata(_name, _image, _description);
        _mint(_tokenOwner, newItemId);

        return newItemId;
    }

    
    function getTokenMetadata(uint256 _tokenID) public view returns( Metadata memory) {
        return metadata[_tokenID];
    }
}