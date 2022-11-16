pragma solidity ^0.8.13;

contract MyContract {
    address public owner;
    string public public_name;
    string private private_name;
    string internal internal_name;

    event Pay(address indexed sender, uint amount);

    constructor(string memory _name) {
        owner = msg.sender;
        public_name = _name;
        private_name = _name;
        internal_name = _name;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        // Underscore is a special character only used inside
        // a function modifier and it tells Solidity to
        // execute the rest of the code.
        _;
    }

    function externalFunc() external pure returns (string memory) {
        return "external function called";
    }

    function internalFunc() internal view returns (string memory) {
        return internal_name;
    }

    function testInternalFunc() public onlyOwner view virtual returns (string memory) {
        return internalFunc();
    }

    function pay() public payable {
        emit Pay(msg.sender,msg.value);
    }
}