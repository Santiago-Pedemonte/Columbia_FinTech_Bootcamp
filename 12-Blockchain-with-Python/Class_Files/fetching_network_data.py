from bit import wif_to_key

key = wif_to_key("PRIVATE_KEY_IN_WIF_FORMAT_HERE")

key.get_balance("btc")

key.balance_as("usd")

key.get_transactions()

key.get_unspents()
