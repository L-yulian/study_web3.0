// SPDX-License-Identifier: MIT
pragma solidity ^0.8;
import "@openzeppelin/contracts/access/Ownable.sol";
/*
✅ 创建一个名为Voting的合约，包含以下功能：
一个mapping来存储候选人的得票数
一个vote函数，允许用户投票给某个候选人
一个getVotes函数，返回某个候选人的得票数
一个resetVotes函数，重置所有候选人的得票数
*/
contract Voting is Ownable {
    mapping (address => uint256) public votesReceived;
    mapping (address => bool) public voted;
    address[] private receivers;
    address[] private voters;
    constructor() Ownable(msg.sender) {}

    modifier onlyOne{
        require(voted[msg.sender] == false, "You have Voted");
        _;
    }

    modifier receiverIsExisted(address _receiver){
        for(uint i = 0; i<receivers.length;i++) {
        require(_receiver != receivers[i], "Addition failed, the candidate already exists. ");
        }
        _;
    }

    function addReceiver(address _receiver) external receiverIsExisted(_receiver) onlyOwner{
        receivers.push(_receiver);
        votesReceived[_receiver] = 0;
    }

    function vote(address _recevier) external onlyOne {
        require(_recevier != address(0));
        votesReceived[_recevier] += 1;
        voted[msg.sender] = true;
        voters.push(msg.sender);
    }

    function getVotes(address _recevier) external view returns (uint256) {
        return votesReceived[_recevier];
    }

    function getReceivers() external view returns (address[] memory) {
        return receivers;
    }

    function resetVotes() external  onlyOwner{
        for(uint i = 0; i < receivers.length; i++){
             votesReceived[receivers[i]] = 0;
        }
        for(uint i = 0; i < voters.length; i++){
            voted[voters[i]] = false;
        }
    }
}