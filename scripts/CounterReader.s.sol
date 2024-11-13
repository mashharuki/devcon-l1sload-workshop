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
    CounterReader counterReader = new CounterReader(0x44C649EEc7FEEB92D6e7D0a3D8D28b9413361F05);

    console.log("CounterReader deployed at: %s", address(counterReader));

    vm.stopBroadcast();
  }
}