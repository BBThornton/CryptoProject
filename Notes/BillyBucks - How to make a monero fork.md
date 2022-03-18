# BillyBucks - How to make a monero fork
Note Created: 2022-03-03

## Instructions to make MoneroFork
- Make the [changes](#changes-to-the-monero-source-code)
- Generate the Genesis blocks
  - run ./monerod --print-genesis-tx

## Changes to the monero source code

Change the Cryptonote config in the monero SRC folder based on the [[Forking and deploying cryptonote]]

Change the coin name **Line 159**

Change the Network ID **Line 218**
    https://www.random.org/bytes/

Change the network ID of the stagenet and testnet (final byte increase by one)

Remove the seednodes from net_node.h and .inl

# set this to 0 if per-block checkpoint needs to be disabled
set(PER_BLOCK_CHECKPOINT 0)




Remove the genesis_tx
> https://monero.stackexchange.com/questions/2886/how-can-i-create-a-new-monero-genesis-block?newreg=d0b1044c62df469589e771ac38652c7d
> https://monero.stackexchange.com/questions/8724/how-to-create-a-genesis-block
> https://monero.stackexchange.com/questions/8490/monero-genesis-transaction-nonce
> https://monero.stackexchange.com/questions/8468/how-can-i-get-my-own-genesis-tx-to-use-in-my-monero-fork
> https://monero.stackexchange.com/questions/8328/genesis-transaction-explanation

Change the names of the constructed programs using the CMAKE files



