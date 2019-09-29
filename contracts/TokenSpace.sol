pragma solidity >=0.4.21 <0.6.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./ISpace.sol";

// Can be an ERC20, ERC721, ERC777
interface IERCToken {
    function balanceOf(address user) external view returns (uint);
}

contract TokenSpace is ISpace {
    IERCToken token;
    
    constructor(address _token) public {
        token = IERCToken(_token);
    }

    function isMember(address x) public view returns (bool) {
        return token.balanceOf(x) > 0;
    }
}