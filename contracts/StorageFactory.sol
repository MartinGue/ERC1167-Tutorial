pragma solidity 0.4.23;
import "./Storage.sol";
import "https://github.com/optionality/clone-factory/blob/master/contracts/CloneFactory.sol";

contract StorageFactory {
    address public admin;
    address public implementation;
    address[] public clonedContracts;   

    function StorageFactory(address _implementation) public {
        implementation = _implementation;
        admin = msg.sender;
    }
    function createStorage() {
        require(msg.sender == admin, "only admin can clone contract");
        address clone = createClone(implementation);
        //Storage(clone).init(myArg); thata hoew you would initialise the clone
    clonedContracts.push(clone);
    }
    function getAddress(uint i) view external returns(address) {
        return clonedContracts[i];
    }
}