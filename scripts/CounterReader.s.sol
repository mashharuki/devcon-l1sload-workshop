// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {CounterReader} from "./../src/Counter.sol";
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
    CounterReader counterReader = new CounterReader(0x69A6dD2382020C92674fF31d3a1346b8ACda049B);

    console.log("CounterReader deployed at: %s", address(counterReader));

    vm.stopBroadcast();
  }
}