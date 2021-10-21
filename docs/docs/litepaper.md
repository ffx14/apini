---
id: litepaper
title: Litepaper
sidebar_position: 4
---
 
## Introduction {#introduction}
 
Goal of apini is to define and implement protocol for decentralized high frequency trading system and other crypto services.
We are aiming at handling NASDAQ level of load without any centralized system, all of it using open blockchains where anyone can become a validator and anyone can use it just by correctly signing cryptographic messages. 
Our approach is to have purpose-built high-throughput optimized blockchains which would completely eliminate a need for any type of custody or off-chain order book processing.
 
## APN {#apn}
APN is native cryptocurrency for Apini, it's one coin used natively on all chains. It's like ETH for Ethereum.  
With initial Coin Distribution total supply is set to 18 000 000 APN, expectation is that long term APN will be deflationary which will be explained in detail below.
 
## Decentralization {#decentralization}
 
Decentralization and good distribution of APN is very important for the project's future.
If we fail on any of these properties, the project might have a hard time to outlive its creators. 
Apini is a new project focusing rather on technical aspects than marketing/hype/sale which makes it very challenging.
We will try our best to make design decisions which are leading to higher probability of achieving that.
 
## Chains {#chains}
Apini consists of multiple blockchains working together. All chains listed below are using Proof of Stake consensus. Staking is done with one and the same APN coin.
 
### Main chain (L1) {#main-chain}
Main chain is the foundation for other chains, we are using Ethereum 2.0 (Beacon Chain) consensus. 
This is the main layer holding the main wallet state, all decentralized bridges and main accounting is done on the main chain.
 
As of time of writing in order to become validator on Ethereum 2.0 validator is required to stake ~ 128 000$ worth of ETH. 
In our opinion this is just ridiculous, this is not how you achieve a good level of decentralization.  
As we are using exactly the same consensus as Ethereum 2.0 our goal is to have a staking requirement to be always around 10 000$. 
 
Main chain nodes and validators are meant to be run in homes around the world instead of requiring highly specialized hardware run in data centers.
 
### Operator sidechain {#operator-sidechain}
Operator nodes are designed for high-frequency order book processing.
It's an open chain which means everyone has access and can see which wallets are making what trades or what the order book exactly looks like.
 
Operator nodes will require higher-spec hardware and higher throughput symmetric network connection.
All state transitions agreed by operator sidechain at the end will be validated and applied on main chain (L1) meaning that operators from operator chain will be rewarded or penalized on main chain.
 
### Rapid sidechain {#rapid-sidechain}
Rapid is a general-purpose high-throughput chain integrated within the apini ecosystem. 
It will allow anyone to deploy & interact with smarcontracts in a cheap and quick way. 
In short, the goal is to be competitive with Solana having at the same time a much better decentralization level.
 
:::info
Rapid is part of long term vision and is planned no earlier than beginning of 2023, please check our roadmap.
:::
## Bridges {#bridges}
In order to bring assets into apini, fundamental parts are bridges without custody between apini and other popular chains supporting smart contracts.
We are aiming to start with Ethereum bridge and in future add: Binance Smart Chain, Solana, Polkadot, Cardano and more.
Bridges will allow to bring in and out "ERC-20" tokens and NFTs.
 
## Operations {#operations}
 
### Token transactions {#tokens}
Main chain will handle state transition for an unlimited amount of tokens. 
Main being APN and others being bridged tokens or user created tokens. We will natively support custom "ERC-20" compatible tokens  and NFTs on the main chain.
 
### Withdrawal / Deposit auctions {#withdrawal-deposit-auctions}
Main way to get assets in and out are decentralized bridges between blockchains. 
Problems with bridges are that they might get expensive and slow, which are sometimes required properties to make it secure. 
We want to introduce transfer auctions on chains which would allow moving assets without using bridges.
 
Imagine you have ETH token on apini which you want to withdraw as native ETH on Ethereum chain. Instead of using a bridge you can create an auction request specifying the amount and target wallet on Ethereum chain. Anyone who have ETH on Ethereum and is willing to accept your ETH token on apini can participate in such auction. Validators on apini can verify if such transfer happened in agreed way on Ethereum chain.
 
This creates an additional open & competitive market for people willing to handle such withdrawals/deposits. 
Such auctions will be even more useful once we start bridging chains without smart contract support (like Bitcoin).
 
### Order book trading {#order-book-trading}
 
There are two main types of trading algorithms: order book & automated market maker (AMM).  
Example for order book is NASDAQ, Binance, FTX, Serum  
Example for AMM is Uniswap, PancakeSwap  
 
Apini is using order book trading which will allow it to achieve great liquidity and throughput.
We will support instant market trades & limit orders.
 
 
### Spot trading {#spot-trading}
 
Spot trading is about trading tokens directly like APN, USDC, USDT, ETH etc. 
Apini will support unlimited combinations of trading pairs.
 
### Borrowing / Lending {#borrowing-and-lending}
 
Borrowing & Lending will be available directly on the main chain with 1 hour settlement. 
Anyone can Lend their tokens and have them back within 1 hour.
 
### Perpetual contracts {#perpetual-contracts}
 
Perpetual contracts are the most common way of trading on cryptocurrency price difference today.
 
Perpetual contracts will have funding rate settlement done every 1 hour. 
Funding rates will be calculated on the main chain using index price from spot pairs. 
 
We are aiming to support leverage up to 20x.
 
### Traditional market contracts {#traditional-market-contracts}
 
Having support for perpetual contracts on crypto pairs it's actually technically possible to create perpetual contracts on any value which changes in time, as long as there is some reference value (index). 
For the perpetual contract of APN or ETH we have spot price as index so we could keep perpetual price aligned to spot price using funding rates.
 
It's possible to bring values through decentralized Oracles from traditional markets and create perpetual contracts on them, for example it's possible to have perpetual contracts on stocks like Tesla, Amazon, Apple or indexes like S&P 500, NASDAQ and so on.
 
 
:::info
Traditional market perpetual contracts are not part of the roadmap today. 
We see such possibility and potential which we will explore in future.
:::
 
 
## Trading fees {#trading-fees}
 
:::info
Trading fees are a subject to change in future, it can be done through governance voting.
:::
 
Market taker is paying **0.03%** trade fee which is distributed in following way:
* **0.015%** is going to market maker as reward for providing liquidity
* **0.015%** is bought back on spot in form of APN and burned (removed from existence)
 
After we reach complete decentralization of operators, distribution will be changed in following way:
 
:::info
Operator decentralization is expected to happen in Q3 2022, please follow our roadmap.
:::
 
* **0.01%** is going to market maker as reward for providing liquidity
* **0.01%** is bought back on spot in form of APN and distributed between operators as reward for securing chain
* **0.01%** is bought back on spot in form of APN and burned (removed from existence)
 
 
 
We are burning part of the fee in APN to compensate for other issuance done as part of reward to validators securing the main chain.
 
 
Additionally to defend the operator chain from DDoS attack there is dynamic APN fee per transaction which will be equal to a fraction of a cent most of the time. Operator chain will handle thousands of requests per second, this fee is required to make any spam attack very expensive to execute. Transaction fee on operator chain is burned, if it would be passed to operators they would be one which could execute such type of an attack with lower cost than anyone else.
 
 
 
## Initial Coin Distribution {#initial-coin-distribution}
:::tip
Distribution and ICO is explained in more details [here](/docs/ico)
:::
 
Initial Coin Distribution of APN was designed to achieve as good distribution as possible. This is the main reason why we are giving away as much as 40% of it. Public sale part is there to help us grow the development team.
 
 
## Decentralizing validators {#decentralizing-validators}
 
It's challenging to bootstrap PoS chain, apini had two choices:
1. Start with PoA and hard fork to PoS once APN gets good enough distribution.
2. Start with PoS owning all initial validators.
 
We went with option (2) but decided to give away 40% of APN supply over the first 2 years to validators, this is hopefully a way to quickly get a good distribution of validators to properly secure the main chain.
This makes it easier for us and allows anyone to become a validator from day 0 of mainnet. We really encourage you to do so.
 
All first 25k validators are distributed between apini developers.