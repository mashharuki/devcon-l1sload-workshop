// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {L1SLOAD} from "./l1sload/L1SLOAD.sol";

/**
 * 変数をインクリメントするだけのシンプルなコントラクト
 */
contract Counter {
    uint256 public number;

    function increment() public {
        number++;
    }
}

/**
 * Counterコントラクトのステートを読み取るコントラクト
 * L2側にデプロイする。
 */
contract CounterReader {
    address public immutable counter;

    constructor(address _counter) {
        counter = _counter;
    }

    /**
     * Counterコントラクトの値を読み取るメソッド
     * スロットの値を指定する。
     */
    function readCounter() external view returns (uint256) {
        uint256 val0 = L1SLOAD.readUint256(counter, bytes32(uint256(0)));
        return val0;
    }
}
