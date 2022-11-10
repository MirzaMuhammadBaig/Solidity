// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract timeLock{

    uint public timePeriod ;
    uint public totalSupply;
    uint public amountOfToken;
    uint public stuckamountOfToken;
    address public owner = msg.sender;
    string public TokenSymbol = "MMB";
    string public TokenName = "Muhammad";

    mapping(address => uint) public balanceOf;
    mapping(address=>uint) public minterAddress;

    error PleaseWaitTillCurrentUserFree();

    function mint(uint amount) external {
        if(timePeriod < block.timestamp){
        require(msg.sender != owner,"You can't can this function");
        totalSupply += amount;
        amountOfToken = amount -= 30%amount;
        stuckamountOfToken += 30%amount;
        balanceOf[msg.sender] += amountOfToken;
        address payable minter = payable(msg.sender);
        minter.transfer(minterAddress[msg.sender]);
        minterAddress[msg.sender] += amountOfToken;
        timePeriod =  block.timestamp + 1 minutes;
        }else{
            revert PleaseWaitTillCurrentUserFree();
        }
    }

    function claim () external {
        require(minterAddress[msg.sender] > 0,"You must be minter");
        require(timePeriod < block.timestamp,"Time remaining");
        amountOfToken = amountOfToken + stuckamountOfToken;
        minterAddress[msg.sender] += stuckamountOfToken;
        balanceOf[msg.sender] += stuckamountOfToken;
        stuckamountOfToken -= stuckamountOfToken;
    }
}
