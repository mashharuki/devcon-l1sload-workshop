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

## 何でそもそもこれが必要なのか？

スマコンウォレットを L2 ごとにデプロイとかすることになる・・・。
⇨ L1 のみにデプロイしておけばセキュリティ的にも良い！

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
