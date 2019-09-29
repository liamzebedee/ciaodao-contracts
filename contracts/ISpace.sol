pragma solidity >=0.4.21 <0.6.0;

interface ISpace {
    function isMember(address a) external view returns (bool);
}