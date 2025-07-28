// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SecurePiggyBank{
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    // Anyone can deposit Ether
    function deposit() public payable{}

    // Only the owner can withdraw
    function withdraw() public{
        require(msg.sender == owner, "Only owner can withdraw");
        payable(msg.sender).transfer(address(this).balance);
    }
}
