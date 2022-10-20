// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Muhammad_Token is ERC20, Ownable {

    using SafeMath for uint256;

    uint256 public token;
    uint public timePeriod = 300;
    uint public immutable totalTime;
    uint256 public lockedAmountofToken;
    uint public currentTime = block.timestamp;

    constructor() ERC20("Muhammad_Token", "MMB") {
        totalTime = block.timestamp + timePeriod; 
    }

    function mint(address to, uint256 amount) public onlyOwner {
            lockedAmountofToken  = 3000/amount ; 
            token = amount - lockedAmountofToken;
            _mint(to, token);    
    }

    function releaseLockedToken(address to) public {
        require(block.timestamp > totalTime, "Your locked time is not end yet");
            _mint(to, lockedAmountofToken); 
    }
}