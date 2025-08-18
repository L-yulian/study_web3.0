// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

/*
题目描述：反转一个字符串。输入 "abcde"，输出 "edcba"
*/
contract Reverse {
    function reverseString(string memory _srt) external pure returns (string memory) {
        bytes memory strBytes = bytes(_srt);
        uint length = strBytes.length;
        string memory reversedString = "";
        for (uint i = 0; i < length / 2 ; i++) {
            bytes1 temp = strBytes[i];
            strBytes[i] = strBytes[length - i - 1];
            strBytes[length - i - 1] = temp;
        }
        reversedString = string(strBytes);
        return reversedString;
    }
}