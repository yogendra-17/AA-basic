// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Lock {
    
    uint counter;

    constructor() {
        counter = 0;
    }
 

    function increment() public {
        counter++;
    }

}
