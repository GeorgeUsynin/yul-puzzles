// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToDynamicArray {
    uint256[] writeHere;

    function main(uint256[] memory x) external {
        assembly {
            // your code here
            // store the values in the DYNAMIC array `x` in the storage variable `writeHere`
            // Hint: https://www.rareskills.io/post/solidity-dynamic

            // solution
            let l := mload(x)
            sstore(writeHere.slot, l)

            mstore(0x00, writeHere.slot)
            let base := keccak256(0x00, 32)

            let data := add(x, 32)

            for {
                let i := 0
            } lt(i, l) {
                i := add(i, 1)
            } {
                sstore(add(i, base), mload(add(data, mul(i, 32))))
            }
        }
    }

    function getter() external view returns (uint256[] memory) {
        return writeHere;
    }
}
