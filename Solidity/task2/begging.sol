// SPDX-License-Identifier: MIT
pragma solidity ^0.8;


contract BeggingContract   {
    address public owner;
    mapping (address => uint256) public donationAccount;
    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "You are not owner");
        _;
    }

    event Donate(address donate, address receiver, uint256 value);
    event Withdraw(address receiver, uint256 value);

    receive() external payable { }
    fallback() external payable { }

    function donate() external payable returns (bool){
        require(msg.value > 0, "Donation should be greater than 0");
        donationAccount[msg.sender] += msg.value;
        (bool success,) = address(this).call{value:msg.value}("");
        emit Donate(msg.sender, address(this), msg.value);
        return success;
    }

    function withdraw() external onlyOwner {
        require(address(this).balance > 0, "No balance");
        (bool success,) = owner.call{value:address(this).balance}("");
        require(success, "Withdraw failed");
        emit Withdraw(owner, address(this).balance);
    }

    function getDonation(address _donater) external view returns (uint256) {
        return donationAccount[_donater];
    }
}