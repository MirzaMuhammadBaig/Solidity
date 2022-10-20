// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract sendether {
    uint public EtherAmount;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyme() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    function TransferEther() public payable {
        require(msg.value < 3 ether, "please pay me ether");
        EtherAmount = msg.value;
    }
}
