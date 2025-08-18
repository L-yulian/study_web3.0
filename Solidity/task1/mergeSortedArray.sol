// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

/*
✅  合并两个有序数组 (Merge Sorted Array)
题目描述：将两个有序数组合并为一个有序数组。
*/

contract MergeSortedArray {

    function mergeArray(uint256[] memory _arr1, uint256[] memory _arr2) public pure returns (uint256[] memory) {
        uint256 len1 = _arr1.length;
        uint256 len2 = _arr2.length;
        uint256[] memory merge = new uint256[](len1 + len2);
        for(uint256 i = 0; i < len1; i++) {
            merge[i] = _arr1[i];
        }

        for(uint256 i = 0; i < len2; i++) {
            merge[len1 + i] = _arr2[i];
        }

        return sort(merge);
        
    }

    function sort(uint256[] memory _arr) internal pure returns (uint256[] memory) {
        for(uint256 i =   0; i < _arr.length; i++) {
            uint256 j = 0;
            while (j < _arr.length - 1) {
                if (_arr[j] > _arr[j + 1]) {
                    uint256 temp = _arr[j + 1];
                    _arr[j + 1] = _arr[j];
                    _arr[j] = temp;
                }
                j++;
            }
        }

        return _arr;
    }
    
}