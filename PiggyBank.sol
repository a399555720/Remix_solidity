// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract PiggyBank {
    address owner;

    modifier onlyOwner{
        require( owner == msg.sender, "error");
        _;
    }

    constructor() payable {
        owner = msg.sender;
    }

    receive() external payable {}

    function withdraw() onlyOwner external{
        address payable receiver = payable(msg.sender);
        receiver.transfer(address(this).balance);
    }
}