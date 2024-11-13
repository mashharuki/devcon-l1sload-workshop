// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {Counter} from "./../src/Counter.sol";
import {console} from "forge-std/console.sol";

/**
 * Counterデプロイ用のスクリプト
 */
contract CounterScript is Script {
  function run() external {
    uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
    vm.startBroadcast(deployerPrivateKey);
    // Counterのデプロイ
    Counter counter = new Counter();

    console.log("Counter deployed at: %s", address(counter));

    vm.stopBroadcast();
  }
}