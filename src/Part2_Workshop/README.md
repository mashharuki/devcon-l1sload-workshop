# 試した記録

sepolia にデプロイしたアドレス

[0x44C649EEc7FEEB92D6e7D0a3D8D28b9413361F05](https://sepolia.etherscan.io/address/0x44C649EEc7FEEB92D6e7D0a3D8D28b9413361F05)

scroll にデプロイしたアドレス

[0x025755dfebe6eEF0a58cEa71ba3A417f4175CAa3](https://sepolia.scrollscan.com/address/0x025755dfebe6eEF0a58cEa71ba3A417f4175CAa3)

デプロイしたコマンド

```bash
source .env
forge script scripts/L2Contract.s.sol:L2ContractScript --rpc-url $SCROLL_SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast -vvv
```

シミュレーションの結果

```bash
== Logs ==
  L2Contract deployed at: 0x025755dfebe6eEF0a58cEa71ba3A417f4175CAa3

## Setting up 1 EVM.

==========================

Chain 534351

Estimated gas price: 38.722598861 gwei

Estimated total gas used for script: 587419

Estimated amount required: 0.022746390300329759 ETH

==========================

SIMULATION COMPLETE. To broadcast these transactions, add --broadcast and wallet configuration(s) to the previous command. See forge script --help for more.

Transactions saved to: /Users/harukikondo/git/devcon-l1sload-workshop/broadcast/L2Contract.s.sol/534351/dry-run/run-latest.json

Sensitive values saved to: /Users/harukikondo/git/devcon-l1sload-workshop/cache/L2Contract.s.sol/534351/dry-run/run-latest.json
```

デプロイした記録

```bash
Script ran successfully.

== Logs ==
  L2Contract deployed at: 0x025755dfebe6eEF0a58cEa71ba3A417f4175CAa3

## Setting up 1 EVM.

==========================

Chain 534351

Estimated gas price: 38.722622133 gwei

Estimated total gas used for script: 587419

Estimated amount required: 0.022746403970744727 ETH

==========================

##### scroll-sepolia
✅  [Success]Hash: 0xec8b96262969eaa395b1037d84b2246af08829349e69596ef2d8c6b16c3d2fc0
Contract Address: 0x025755dfebe6eEF0a58cEa71ba3A417f4175CAa3
Block: 7266650
Paid: 0.017497242759639513 ETH (451861 gas * 38.722622133 gwei)

✅ Sequence #1 on scroll-sepolia | Total Paid: 0.017497242759639513 ETH (451861 gas * avg 38.722622133 gwei)


==========================

ONCHAIN EXECUTION COMPLETE & SUCCESSFUL.

Transactions saved to: /Users/harukikondo/git/devcon-l1sload-workshop/broadcast/L2Contract.s.sol/534351/run-latest.json

Sensitive values saved to: /Users/harukikondo/git/devcon-l1sload-workshop/cache/L2Contract.s.sol/534351/run-latest.json
```

コマンドでテキストを設定した時の記録

```bash
cast call 0x44C649EEc7FEEB92D6e7D0a3D8D28b9413361F05 "storeNumber(uint256)" 1 --rpc-url $SEPOLIA_RPC_URL
```

```bash
0x
```

コマンドで機能呼び出し

```bash
cast call 0x025755dfebe6eEF0a58cEa71ba3A417f4175CAa3 "retrieveL1Number()" --rpc-url $SCROLL_SEPOLIA_RPC_URL
```
