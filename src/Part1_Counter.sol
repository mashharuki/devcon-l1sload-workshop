// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {L1SLOAD} from "./l1sload/L1SLOAD.sol";

/// @title A simple counter contract
/// @dev This contract should be deployed on L1
contract Counter {
    uint256 public number;
    mapping(uint256 => uint256) public map;

    function increment() public {
        number++;
        map[123] = 2 * number; //map[123]に値をセット
    }
}

/// @title A simple contract that reads the counter through L1SLOAD
/// @dev This contract should be deployed on L2
contract CounterReader {
    /// @dev The L1 counter contract address
    address public immutable counter;

    constructor(address _counter) {
        counter = _counter;
    }

    /// @notice Reads `number` and `map[123]` from L1 using L1SLOAD
    /// @dev This function reads values from L1
    function readCounter() external view returns (uint256, uint256) {
        // slot0とslot1の設定
        bytes32 slot0 = bytes32(0);
        bytes32 slot1 = keccak256(abi.encode(123, 1));

        bytes memory payload = abi.encodePacked(counter, slot0, slot1);
        // ストレージ0の値を読み込む
        (bool success, bytes memory ret) = L1SLOAD.ADDRESS.staticcall(payload);   

        if(!success) {
            revert("L1SLOAD failed");
        }

        (uint256 val0, uint256 val1) = abi.decode(ret, (uint256, uint256));
        return (val0, val1);
    }
}
