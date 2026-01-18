// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract MaxOfArray {
    function main(uint256[] memory arr) external pure returns (uint256) {
        assembly {
            // your code here
            // return the maximum value in the array
            // revert if array is empty

            // solution
            let l := mload(arr)

            if eq(l, 0) {
                revert(0, 0)
            }

            for {
                let i := 1
                let j := add(arr, 32)
            } lt(i, l) {
                i := add(i, 1)
                j := add(j, 32)
            } {
                if gt(mload(j), mload(add(j, 32))) {
                    mstore(add(j, 32), mload(j))
                }
            }

            return(add(arr, mul(mload(arr), 32)), 32)
        }
    }
}
