pragma solidity >=0.4.21 <0.6.0;

import "./ISpace.sol";
import "./TokenSpace.sol";
import "./experiments/basic/ERC721Space.sol";

// TODO(liamz): typo should be space factory
contract SpaceCadetFactory {
    event NewSpace(address indexed space, string indexed name);

    constructor() public {
    }

    function createTokenSpace(string calldata name, address erc20) external {
        ISpace space = new TokenSpace(erc20);
        emit NewSpace(address(space), name);
    }

    function createPersonalSpace(string calldata name, address[] calldata invitees) external {
        ISpace space = new ERC721Space(name, invitees);
        emit NewSpace(address(space), name);
    }
}
