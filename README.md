## L1SLOAD Workshop

**L1SLOAD is a precompile that allows your L2 dapp to use L1 (Ethereum) data**

What L1SLOAD unlocks:

- Write normal Solidity code to get direct read access to L1 state from your L2 contract.
- Developer-friendly building block for better L1/L2 interoperability.

Read more about RIP-7728: L1SLOAD [here](https://github.com/ethereum/RIPs/blob/master/RIPS/rip-7728.md).

## Documentation

This repository contains the resources which are covered in the [L1SLOAD Workshop](https://app.devcon.org/schedule/ERQ7N3) during Devcon:

**Part 1**: Includes simple examples to get started. It also shows L1SLOAD utility contracts for configuring a local test environment in Foundry.

**Part 2**: Explore various examples demonstrating how to interact with different data types and structures in Solidity.

**Part 3**: Dive into a real-world use case by exploring [Keystore](https://scroll.io/blog/towards-the-wallet-endgame-with-keystore).

## RIP-7728 とは

## 何でそもそもこれが必要なのか？

スマコンウォレットを L2 ごとにデプロイとかすることになる・・・。
⇨ L1 のみにデプロイしておけばセキュリティ的にも良い！

## セットアップ

- インストール

  ```bash
  yarn
  ```

- 環境変数

  `.env`ファイルを作成

  ```txt
  SEPOLIA_RPC_URL=""
  SCROLL_SEPOLIA_RPC_URL=""
  PRIVATE_KEY=""
  ```

## 動かした記録

- ビルド

  ```bash
  forge build
  ```

- テスト

  ```bash
  forge test
  ```

- インスペクトコマンド

  ```bash
  forge inspect ./src/Counter.sol:Counter abi --pretty
  ```

- デプロイコマンド

  以下のコマンドを実行する前にこのコマンドを実行する。

  ```bash
  source .env
  ```

  - シンプルな Counter コントラクトと CounterReader コントラクトをデプロイする。

    Counter コントラクトは、L1 側にデプロイする。

    ```bash
    yarn deploy:Counter --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY
    ```

    [0x69A6dD2382020C92674fF31d3a1346b8ACda049B](https://sepolia.etherscan.io/address/0x69A6dD2382020C92674fF31d3a1346b8ACda049B)

    Verify

    ```bash
    forge verify-contract --chain 11155111 --num-of-optimizations 200 0x69A6dD2382020C92674fF31d3a1346b8ACda049B src/Counter.sol:Counter --etherscan-api-key $ETHERSCAN_API_KEY
    ```

    CounterReader コントラクトは、L2 側にデプロイする。

    ```bash
    yarn deploy:CounterReader --rpc-url $SCROLL_SEPOLIA_RPC_URL --private-key $PRIVATE_KEY
    ```

    [0x7ceCC1CefD4352EE0388BD34e6638742AC0a1253](https://sepolia.scrollscan.com/address/0x7ceCC1CefD4352EE0388BD34e6638742AC0a1253)

    Verify

    ```bash
    forge verify-contract --chain 534351 --num-of-optimizations 200 0x7ceCC1CefD4352EE0388BD34e6638742AC0a1253 src/Counter.sol:CounterReader --constructor-args $(cast abi-encode "constructor(address)" 0x69A6dD2382020C92674fF31d3a1346b8ACda049B) --etherscan-api-key $SCROLLSCAN_API_KEY
    ```

  - Part1 のコントラクトのデプロイ

    - Counter コントラクト

      ```bash
      yarn deploy:Part1_Counter --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --verify --etherscan-api-key $ETHERSCAN_API_KEY
      ```

    - CounterReader コントラクト

      ```bash

      ```

- コントラクトの操作

  - Counter コントラクト

    - increment

      ```bash
      cast send 0x69A6dD2382020C92674fF31d3a1346b8ACda049B "increment()" --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY
      ```

    - get number

      ```bash
      cast call 0x69A6dD2382020C92674fF31d3a1346b8ACda049B "number" --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --etherscan-api-key $ETHERSCAN_API_KEY
      ```

  - CounterReader コントラクト

    - get L1 Contract value

      ```bash
      cast call 0x7ceCC1CefD4352EE0388BD34e6638742AC0a1253 "readCounter()" --rpc-url $SCROLL_SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --etherscan-api-key $SCROLLSCAN_API_KEY
      ```

    - L1 counter address

      ```bash
      cast call 0x7ceCC1CefD4352EE0388BD34e6638742AC0a1253 "counter" --rpc-url $SCROLL_SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --etherscan-api-key $SCROLLSCAN_API_KEY
      ```

### 参考文献

1. [ワークショップのスライド](https://docs.google.com/presentation/d/1NSfqhMNK_7nXl_l5jHl_nXBf2m7cibFj8VIJtumUEkY/mobilepresent?slide=id.g313d959114e_0_11)
2. [GitHb - devcon-l1sload-workshop](https://github.com/scroll-tech/devcon-l1sload-workshop)
3. [ショーケース](https://ethglobal.com/showcase/all-my-unicorn-read-on-l1-1v7jk)
4. [ショーケース 2](https://ethglobal.com/showcase/toadnado-vvkcb)
5. [ショーケース 3](https://ethglobal.com/showcase/resolving-ens-on-l2-0a071)
6. [GitHb - l1-staking-and-l2-borrow](https://github.com/1997roylee/l1-staking-and-l2-borrow)
7. [GitHb - toadnado](https://github.com/nodestarQ/toadnado)
8. [RIP-7728: L1SLOAD precompile](https://ethereum-magicians.org/t/rip-7728-l1sload-precompile/20388)
9. [L1SLOAD guide: Read the L1 state from L2](https://www.levelup.xyz/content/l1sload-guide-read-the-l1-state-from-l2)
