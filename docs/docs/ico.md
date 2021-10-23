---
id: ico
title: ICO
sidebar_position: 2
---
 
:::info
BEP-20 APN contract address is: [0xc06B2647149B3fA3Dbb677A0E885f481f6eaCe52](https://bscscan.com/address/0xc06b2647149b3fa3dbb677a0e885f481f6eace52)
:::

## Distribution {#distribution}
 
Total initial supply is **18 000 000 APN**, which is distributed in following way:
 
* **7 200 000 APN** [40%] will be given away to validators over 2 years counting from mainnet start.  
   Airdrops will be deposited directly on Apini Chain every week evenly distributing 69 230 APN between active validators. (On top of standard validator staking reward)
 
* **7 200 000 APN** [40%] will be swapped for BNB  through faucet over a period of 170 days. This part is the main source of funding for project.
 
* **1 800 000 APN** [10%] will be frozen in the Innovation Fund.  
APN will be released lineary over span of **10 years** (15 000 APN per month). Purpose of Innovation Fund is to provide support in longer timeframe (bug bounty program, donations for other open source projects and apini development)
 
* **1 800 000 APN** [10%] will be distributed between development team in following way:  
1) **1 725 000 APN** in form of first 25k validators on main chain required for PoS consensus  
2) **75 000 APN** in form of BEP-20 APN token
 
## ICO sale {#ico-sale}
 
In order to grow the development team apini decided to go with the public sale of APN instead of looking for private investors.
We believe this will help to achieve better APN distribution and security for the Apini Chain.

Innovation Fund, first validators stake and airdrops for validators will exist only in form of native APN on Apini Chain.  
Total amount of APN minted in form of BEP-20 is **7 275 000**.

First **400 000 APN** together with **10 BNB** were used to [create liquidity pool](https://bscscan.com/tx/0xa005d42d44d794099d24fef74badba9199dd7a860f78d16da608418e989d72af) on PancakeSwap.  
Remaining **6 800 000 APN** is locked in [faucet smart contract](https://) which will slowly distribute APN over a period of around 6 months.

You can swap APN on [PancakeSwap](https://pancakeswap.finance/swap?outputCurrency=0xc06b2647149b3fa3dbb677a0e885f481f6eace52) or check price on [Bogged Finance](https://charts.bogged.finance/0xc06B2647149B3fA3Dbb677A0E885f481f6eaCe52)

## Faucet contract {#faucet-contract}

:::info
APN inside the faucet contract is locked, the only way to get it out is through swapping for BNB which is also time gated.
:::

Faucet is our way to distribute BEP-20 APN slowly over a longer period of time (around 6 months). This is a smart contract with built-in Automated Market Maker which allows anyone to swap BNB for APN.

It lowers price slightly every single second with a starting ratio of **1 APN = 0.02BNB**, every swap raises price accordingly. It behaves like a one-way PancakeSwap/Uniswap with locked liquidity. Release of APN is evenly distributed for period of 170days.

We prefer to do it this way as it's very important to achieve as good distribution of APN as possible.
We want to deliver on a technical level rather than overhype apini so it makes more sense to have an ICO spanning 170 days, a faucet contract allows us to do it.

If you are interested in more details we encourage you to take a look at [smart contract code](https://github.com/apini-io/apini/blob/main/contracts/apn-bep20-faucet.sol). There is an arbitrage opportunity available for everyone.

Faucet contract address: [0xEDd1090d8E672bB5872Ad695eA63B8ad43c0Cf8B](https://bscscan.com/address/0xedd1090d8e672bb5872ad695ea63b8ad43c0cf8b)

:::tip
If you are planning to use faucet directly, please compare its price with PancakeSwap. Most of the time faucet will have an unfavorable price.
:::
 
## Swapping BEP-20 to native APN {#swapping-bep20-to-native}
 
APN is cryptocurrency with it's own blockchain but to make it easy and because we are starting ICO before mainnet, at the beginning part of it will exist in form of BEP-20 token on Binance Smart Chain.  

1 BEP-20 APN is equal to 1 APN on native chain. With start of mainnet every owner of BEP-20 APN will be able to exchange it for native equivalent, it's one way operation which have to happen before **1st of January 2023**.  
Any APN which will not be claimed before this date will be burned.  
Exact details on how to do swap will be announced before mainnet starts.
 
 
 