// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {L2Contract} from "./../src/Part2_Workshop/L2Contract.sol";
import {console} from "forge-std/console.sol";

/**
 * L2Contractデプロイ用のスクリプト
 */
contract L2ContractScript is Script {
  function run() external {
    uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
    vm.startBroadcast(deployerPrivateKey);
    // L2Contractのデプロイ
    L2Contract l2Contract = new L2Contract(0x44C649EEc7FEEB92D6e7D0a3D8D28b9413361F05);

    console.log("L2Contract deployed at: %s", address(l2Contract));

    vm.stopBroadcast();
  }
}