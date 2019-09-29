pragma solidity >=0.4.21 <0.6.0;

import "@openzeppelin/contracts/token/ERC721/ERC721Full.sol";
import "../../ISpace.sol";

// A basic space that is also a DAO!
// Any member can invite in other members, which is all defined by the underlying token
contract ERC721Space is ISpace, ERC721Full {
    uint tokenId = 0;

    constructor(string memory name, address[] memory invitees) ERC721Full(name, "XXX") public {
        _mint(msg.sender, tokenId++);
        inviteMembers(invitees);
    }

    function inviteMembers(address[] memory invitees) public {
        require(isMember(msg.sender), "members-only");
        for(uint i = 0; i < invitees.length; i++) {
            _mint(invitees[i], tokenId++);
        }
    }

    function isMember(address x) public view returns (bool) {
        return this.balanceOf(x) > 0;
    }
}