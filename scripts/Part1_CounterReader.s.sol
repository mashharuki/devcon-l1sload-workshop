// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {CounterReader} from "./../src/Part1_Counter.sol";
import {console} from "forge-std/console.sol";

/**
 * CounterReaderデプロイ用のスクリプト
 */
contract CounterReaderScript is Script {
  function run() external {
    uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
    vm.startBroadcast(deployerPrivateKey);
    // CounterReaderのデプロイ
    // 引数にはL1にデプロイしたコントラクトのアドレスを割り当てる。
    CounterReader counterReader = new CounterReader(0x4BD02c4CbDadcEd33Cd8267D83D28d87c7eA191C);

    console.log("CounterReader deployed at: %s", address(counterReader));

    vm.stopBroadcast();
  }
}