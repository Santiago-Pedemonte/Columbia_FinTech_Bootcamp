<<<<<<< HEAD
# How to use PoA Blockchain

**Note:** Following this guide will create two full nodes with mining capabilities and only one of those with an open RPC port to connect them.

This is a fully working implementation of a Proof-of-authority Blockchain. A transaction was successfully made through the network from one node to another:

![successTxPoa](https://github.com/Santiago-Pedemonte/Private-Blockchains/blob/main/Screenshots/successfulTransaction.png)

You can corroborate the public addresses of the nodes with the ones included in the `Keys, etc....txt` file.

## Network:
**Note:** The relevant information for this guide is also included in the `Keys, etc....txt` file.

![networkPoA](https://github.com/Santiago-Pedemonte/Private-Blockchains/blob/main/Screenshots/zbnetConfigSS.png)

* In the `alloc` section, we can see the addresses of our two nodes. These acounts need to be prefunded since there are no mining rewards in a PoA Blockchain.

## Starting the nodes, ports, and connections:

Open a terminal window (Git Bash in Windows) navigate to your `Geth` folder and follow the next steps.

* Launch the first node into mining mode with the following command if the nodes and blockchain files are in the same folder as Geth executable:

 ```bash
 ./geth --datadir firstNode --unlock '0x7507c9dC90C005650cd85482724D6566E0C3b9FB' --password 'password1.txt' --allow-insecure-unlock --mine --miner.threads 1 --rpc
 ```
 **Note:** Can change `firstNode` with the path to the node's folder if it *isn't* in the same folder as Geth.

 * The `--mine` flag tells the node to mine new blocks.
 * The `--miner.threads` flag tells `geth` how many CPU threads, or "workers" to use during mining. Since the difficulty is low, setting it to 1 is enough.
 * In the case of the PoA Blockchain, we need to unlock the nodes' accounts to verify that they are authorized to mine in the network and generate new blocks.
 * For the `--unlock` and `--password` we need to add the node's public address and the path to the file where the password is contained, respectively.
 * Since we're using the `--allow-insecure-unlock` flag, we could also run the node without the above flags since we are in a local server.
 
You should see the node `Committing new mining work`:

![node mining](https://github.com/Santiago-Pedemonte/Private-Blockchains/blob/main/Screenshots/miningStarted.png)

* This command is included in the `Keys, etc....txt` file under `firstNode`.

Now to launch the second node and configure it to let us talk to the chain via RPC.

* Scroll up in the terminal window where `firstNode` is running, and copy the entire `enode://` address (including the last `@address:port` segment) of the first node located in the `Started P2P Networking` line:

 ![enodeid](https://github.com/Santiago-Pedemonte/Private-Blockchains/blob/main/Screenshots/enodeTerminal.png)

* This is the address that `secondNode` will use to find `firstNode`.

* *Open another terminal window* and navigate to the same directory as before.

* Launch the second node, enable RPC, change the sync port, and pass the `enode://` address of the first node in quotes by running the following command (it will differ in Windows and OS X):

 * Running in OS X:
 ```bash
 Start Node: ./geth --datadir secondNode --port 30304  --bootnodes "enode://<replace with firstNode enode address>" --ipcdisable --mine --miner.threads 1 --unlock '0x9227D3Db09684bb3D43997d603477FA1B7c5F411' --password 'password2.txt'  --allow-insecure-unlock
 ```

 * Running in Microsoft Windows:
 ```bash
 Start Node: ./geth --datadir secondNode --port 30304  --bootnodes "enode://<replace with firstNode enode address>" --ipcdisable --mine --miner.threads 1 --unlock '0x9227D3Db09684bb3D43997d603477FA1B7c5F411' --password 'password2.txt'  --allow-insecure-unlock
 ```
 
 * The `--rpc` flag enables us to talk to our second node, which will allow us to use MyCrypto or Metamask to transact on our chain.
 * Since the first node's sync port already took up `30303`, we need to change this one to `30304` using `--port`.
 * The `--bootnodes` flag allows you to pass the network info needed to find other nodes in the blockchain. This will allow us to connect both of our nodes.
 * In Microsoft Windows, we need to add the flag `--ipcdisable` due to the way Windows spawns new IPC/Unix sockets doesn't allow for having multiple sockets running from `geth` at once. Since we are only using `RCP` we can safely disable the `IPC` sockets.
 * Same as `firstNode` in terms of unlocking the node to authorize it to mine.

The output of the second node should show information about `Importing block segments` and `Committing new mining work`:

 ![node sync](https://github.com/Santiago-Pedemonte/Private-Blockchains/blob/main/Proof-of-Authority%20Blockchain/Screenshots/startSecondNode.png)

* This command is included in the `Keys, etc....txt` file under `secondNode`.

## Troubleshoot

* If you ever encounter strange errors, or need to start over without destroying the accounts, run the following command to clear the chain data (this will reset the `enode` addresses as well):

  ```bash
  rm -Rf firstNode/geth secondNode/geth
  ```
=======

>>>>>>> 928f7cc285acdb69eafc9498dc96c91c8ab8a7e4
