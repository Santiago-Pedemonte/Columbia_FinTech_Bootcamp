# Multi-Blockchain Wallet in Python

## Dependencies

The following dependencies are required to run this code. 

> **Important:** If you have _not_ already installed the dependencies listed below, you may do so by following the instructions found in the following guides:
  > - [HD Wallet Derive Installation Guide](Resources/HD_Wallet_Derive_Install_Guide.md) 
  > - [Blockchain TX Installation Guide](Resources/Blockchain_TX_Install_Guide.md).

**Dependencies List:**
  * PHP must be installed on your operating system.

  * You will need to clone the [`hd-wallet-derive`](https://github.com/dan-da/hd-wallet-derive) tool.

  * [`bit`](https://ofek.github.io/bit/) Python Bitcoin library.

  * [`web3.py`](https://github.com/ethereum/web3.py) Python Ethereum library.

## Description

This project uses the HD-wallet-derive tool to allow for fast derivation and convenient transactions for the supported coins (Only BTC-TEST and ETH at the moment).

  * The function `wallet.py/derive_wallets()` allows you to generate a custom number of keys all linked to a single mnemonic.
  * It currently points to an enviromental file called `keys.env` where you can find the test mnemonic used for this project.
  * The function `wallet.py/priv_key_to_account` converts the private key (which can be accessed by referring to the `coins` dictionary created after the `derive_wallets` function) to an account object that can interact directly with the Blockchain and send transactions. This function needs the following parameters:
  
      * `coin` -- the coin type (defined in constants.py).
      * `priv_key` -- the privkey string will be passed through here.
      
  * The functions `create_tx` and `send_tx` work together to first generate the object for an unsigned transaction (in `create_tx`) and then signs it with the account object's private key to make the transaction valid. Both of these return the `raw_tx`. These functions need the following parameters:
      * `coin` -- the coin type (defined in constants.py).
      * `account` -- the account object from priv_key_to_account.
      * `to` -- the recipient address.
      * `amount` -- the amount of the coin to send.

## Successful Transactions and Commands to Transact

### BTCTEST transaction:

To execute a transaction after you have generated the account object, call the `send_tx` function as follows:
    `send_tx(coins[BTCTEST][0][3], BTCTEST, *recipient's address*, *amount*)`

Once the transaction has been executed, use a block explorer or TxStatus to verify that the transaction went through:

![successfulTransact-BTCTEST](Images/successfulTransactionBtctest)

**Note:** The reference to the `coins` dictionary points to the 'btc-test' key, to the first account's [0] private key [3].

### ETH transaction:

To execute a transaction after you have generated the account object, call the `send_tx` function as follows:
    `send_tx(coins[ETH][0][3], ETH, *recipient's address*, *amount*)`

Once the transaction has been executed, use a block explorer or TxStatus to verify that the transaction went through:

![successfulTransact-ETH](Images/successfulTransactionEth)

**Note:** The reference to the `coins` dictionary points to the 'eth' key, to the first account's [0] private key [3].
