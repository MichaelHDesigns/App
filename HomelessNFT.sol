// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract HomelessNFT is ERC721 {
    uint256 public tokenId;
    struct HomelessIndividual {
        string name;
        uint256 age;
        string gender;
        string location;
        string specificNeeds;
    }
    mapping(uint256 => HomelessIndividual) public homelessIndividuals;

    constructor() ERC721("HomelessNFT", "HNFT") {}

    function createNFT(string memory name, uint256 age, string memory gender, string memory location, string memory specificNeeds) public {
        HomelessIndividual memory newHomelessIndividual = HomelessIndividual(name, age, gender, location, specificNeeds);
        homelessIndividuals[tokenId] = newHomelessIndividual;
        _safeMint(msg.sender, tokenId);
        tokenId++;
    }
}