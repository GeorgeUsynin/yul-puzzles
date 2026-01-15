// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract IsPrime {
    function main(uint256 x) external pure returns (bool) {
        assembly {
            // your code here
            // return true if x is a prime number, else false
            // 1. check if the number is a multiple of 2 or 3
            // 2. loop from 5 to x / 2 to see if it is divisible
            // 3. increment the loop by 2 to skip the even numbers

            // solution
            mstore(0x40, true)

            if eq(x, 1) {
                return(0x60, 32)
            }

            if eq(x, 2) {
                return(0, 32)
            }

            if eq(x, 3) {
                return(0, 32)
            }

            if iszero(mod(x, 2)) {
                return(0x60, 32)
            }

            if iszero(mod(x, 3)) {
                return(0x60, 32)
            }

            for { let i := 5 } iszero(gt(i, div(x, 2))) { i := add(i, 2) } {
                if iszero(mod(x, i)) {
                    return(0x60, 32)
                }
            }

            return(0, 32)
        }
    }
}
