// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

interface IECTOKEN {

    function totalSupply() external view returns (uint);
    function balanceOf(address account) external view returns (uint);

}

contract Token is IECTOKEN {
    address public owner;
    uint public totalSupply;
    string public symbol = "BL";
    string public name = "Blockchain";
    uint public _tokenPrice = 1 ether;

    mapping(address => uint) public balanceOf;
    
    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not allowed for doing this work");
        _;
    }

    function setTokenPrice(uint tokenPrice) public onlyOwner {
        _tokenPrice = tokenPrice;
    }

    function buy() public payable {
        require(msg.sender != owner, "You are not allowed for purchasing");
        require(msg.value >= _tokenPrice, "Not Enough Amount");
        balanceOf[owner] -= msg.value / _tokenPrice;
        balanceOf[msg.sender] += msg.value / _tokenPrice;
    }

    function mint(uint amount) external onlyOwner {
        balanceOf[msg.sender] += amount;
        totalSupply += amount;
    }

    function burn(uint amount) external onlyOwner {
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
    }
}
