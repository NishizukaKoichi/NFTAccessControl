// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC721 {
    function ownerOf(uint256 tokenId) external view returns (address owner);
}

contract AccessControl {
    address public admin;
    IERC721 public nft;
    uint256 public requiredTokenId;

    constructor(address _nftAddress, uint256 _requiredTokenId) {
        admin = msg.sender;
        nft = IERC721(_nftAddress);
        requiredTokenId = _requiredTokenId;
    }

    function verifyOwnership(address _user) public view returns (bool) {
        return nft.ownerOf(requiredTokenId) == _user;
    }
}
