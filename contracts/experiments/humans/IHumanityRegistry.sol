// https://github.com/marbleprotocol/humanity/blob/master/contracts/HumanityRegistry.sol

interface IHumanityRegistry {
    function isHuman(address who) external view returns (bool);
}