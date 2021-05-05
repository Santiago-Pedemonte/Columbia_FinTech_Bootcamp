# Import dependencies
import subprocess
import json
from dotenv import load_dotenv

# Load and set environment variables
import os
load_dotenv('keys.env')
mnemonic=os.getenv("mnemonic")

# Import constants.py and necessary functions from bit and web3
from constants import *
from web3 import Web3
from bit import PrivateKeyTestnet
from eth_account import Account


# Create a function called `derive_wallets`
def derive_wallets(mnemonic, coin, numWallets):
    command = f'php ./derive -g --mnemonic={mnemonic} --coin={coin} --numderive={numWallets} --format=json'
    p = subprocess.Popen(command, stdout=subprocess.PIPE, shell=True)
    output, err = p.communicate()
    p_status = p.wait()
    return json.loads(output)

# Create a dictionary object called coins to store the output from `derive_wallets`.
coins = {'btc-test':derive_wallets(mnemonic, BTCTEST, 3), 'eth':derive_wallets(mnemonic, ETH, 3)}

# Create a function called `priv_key_to_account` that converts privkey strings to account objects.
def priv_key_to_account(priv_key, coin):
    if coin == BTCTEST: return PrivateKeyTestnet(str(priv_key))
    elif coin == ETH: return Account.from_key(str(priv_key))
        

# Create a function called `create_tx` that creates an unsigned transaction appropriate metadata.
def create_tx(account, coin, to, amount):
    if coin == BTCTEST: 
        return PrivateKeyTestnet.prepare_transaction(account.address, [(to, amount, BTC)])
    elif coin == ETH: 
        amount = w3.toWei(Decimal(amount), 'ether') # Transform the amount to Wei
    
    # Estimate the amount of gas needed for the transaction
        gasEstimate = w3.eth.estimateGas(
            {'from': account.address, 'to': to, 'value': amount}
        )
    
        return {
            'from': account.address,
            'to': recipient,
            'value': amount,
            'gasPrice': w3.eth.gasPrice,
            'gas': gasEstimate,
            'nonce': w3.eth.getTransactionCount(account.address),
            'chainId': 1998 
        }

# Create a function called `send_tx` that calls `create_tx`, signs and sends the transaction.
def send_tx(account, coin, to, amount):
    if coin == BTCTEST:
        raw_tx = create_tx(account, coin, to, amount)
        signed_tx = account.sign_transaction(raw_tx)
        return NetworkAPI.broadcast_tx_testnet(signed_tx.rawTransaction)
    elif coin == ETH:
        raw_tx = create_tx(account, coin, to, amount)
        signed_tx = account.sign_transaction(raw_tx)
        return w3.eth.sendRawTransaction(signed_tx.rawTransaction)

