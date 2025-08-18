// SPDX-License-Identifier: MIT
pragma solidity ^0.8;
/*
✅  二分查找 (Binary Search)
题目描述：在一个有序数组中查找目标值。
*/
contract BinarySearchContract {
    function binarySearch(uint256[] memory _arr, uint256 _target) public pure returns (bool, uint256) {
        uint256 left = 0;
        uint256 right = _arr.length - 1;
        while (left <= right) {
            uint256 mid = (left + right) / 2;
            if(_arr[mid] == _target) {
                return (true, mid);
            }else if (_arr[mid] < _target){ 
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
        return (false, 0);
    }
}