// SPDX-License-Identifier: MIT
pragma solidity ^0.8;
/*
✅  用 solidity 实现整数转罗马数字
题目描述在 https://leetcode.cn/problems/roman-to-integer/description/3.
*/
contract RomanToIntContract {
    mapping (bytes1 => uint256) romanMap;

    constructor() {
        romanMap["I"] = 1;
        romanMap["V"] = 5;
        romanMap["X"] = 10;
        romanMap["L"] = 50;
        romanMap["C"] = 100;
        romanMap["D"] = 500;
        romanMap["M"] = 1000;
    }

    function romanToInt(string memory romanNumber) public view returns (uint256 result) {
        bytes memory romanBytes = bytes(romanNumber);
        for(uint256 i = 0; i < romanBytes.length; i++){
            uint256 current = romanMap[romanBytes[i]];
            uint256 next = (i+1) < romanBytes.length ? romanMap[romanBytes[i + 1]] : 0;
            if( current< next){
                result += (next -current);
                i++;
            } else {
                result += current;
            }
        }
    }
}