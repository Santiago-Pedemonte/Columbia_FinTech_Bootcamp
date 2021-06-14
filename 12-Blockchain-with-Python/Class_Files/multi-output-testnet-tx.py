from bit import wif_to_key

# replace with your private key
key = wif_to_key("PRIVATE_KEY_IN_WIF_FORMAT_HERE")

# replace with different addresses
addresses = ["mn9CfkoXJpkCMkPbRcBfUphso7QaDmBmgz", "mv4rnyY3Su5gjcDNzbMLKBQkBicCtHUtFB"]

outputs = []

for address in addresses:
    outputs.append((address, 0.0001, "btc"))

print(key.send(outputs))
