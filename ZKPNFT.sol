// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ZKPNFT {
    // Mapping to track ownership of NFTs by address
    mapping(address => uint256) public tokenOwnership;
    
    // Mapping to track if an address is verified
    mapping(address => bool) public isVerified;
    
    // Total supply of NFTs
    uint256 public totalSupply = 0;
    
    // Event for NFT minting
    event Minted(address indexed user, uint256 tokenId);
    
    // Simple function to verify a user (placeholder for ZKP verification)
    function verifyUser() public {
        // In a real ZKP system, this would check a proof without revealing inputs
        // Without inputs/imports, this is a simplified placeholder
        require(!isVerified[msg.sender], "User already verified");
        isVerified[msg.sender] = true;
    }
    
    // Function to mint an NFT for verified users
    function mintNFT() public {
        require(isVerified[msg.sender], "User not verified");
        require(tokenOwnership[msg.sender] == 0, "User already owns an NFT");
        
        totalSupply += 1;
        tokenOwnership[msg.sender] = totalSupply;
        
        emit Minted(msg.sender, totalSupply);
    }
    
    // Function to check ownership
    function ownerOf(uint256 tokenId) public view returns (address) {
        for (uint256 i = 0; i <= totalSupply; i++) {
            if (tokenOwnership[msg.sender] == tokenId) {
                return msg.sender;
            }
        }
        return address(0); // No owner found
    }
}
