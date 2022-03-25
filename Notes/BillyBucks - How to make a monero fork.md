# BillyBucks - How to make a monero fork
Note Created: 2022-03-03
https://docs.turtlecoin.lol/developer/forking-turtlecoin#cryptonotecheckpointsh
## Instructions to make MoneroFork
- Make the [changes](#changes-to-the-monero-source-code)
- Generate the Genesis blocks
  - run ./monerod --print-genesis-tx

## Changes to the monero source code

Change the Cryptonote config in the monero SRC folder based on the [[Forking and deploying cryptonote]]

Change the coin name **Line 159**

uint64_t const CRYPTONOTE_PUBLIC_ADDRESS_BASE58_PREFIX = 0x5150;

### This times the mining time is how long you need to wait for a reward
# define CRYPTONOTE_MINED_MONEY_UNLOCK_WINDOW            2


Change the Network ID **Line 218**
    https://www.random.org/bytes/

Change the network ID of the stagenet and testnet (final byte increase by one)

Remove the seednodes from net_node.h and .inl

# set this to 0 if per-block checkpoint needs to be disabled
set(PER_BLOCK_CHECKPOINT 0)

# Remove the checkpoints from 
src/checkpoints/checkpoints.cpp






```
version
01
unlock time (varint, height, 60 here)
3c
vin length (value in)
01
vin #1 (of 1) type (gen, 0xff)
ff
height for gen input
00
vout length (value out)
01
output #1 (of 1) amount (17592186044415 as varint)
ffffffffffff03
output #1 type (to key, 0x02)
02
output #1 key (32 bytes)
9b2e4c0281c0b02e7c53291a94d1d0cbff8883f8024f5142ee494ffbbd088071
extra length in bytes (varint, here 33)
21
extra pubkey tag (0x01)
01
transaction pubkey (32 bytes)
7767aafcde9be00dcfd098715ebcf7f410daebc582fda69d24a28e9d0bc890d1
```



Remove the genesis_tx
> https://monero.stackexchange.com/questions/2886/how-can-i-create-a-new-monero-genesis-block?newreg=d0b1044c62df469589e771ac38652c7d
> https://monero.stackexchange.com/questions/8724/how-to-create-a-genesis-block
> https://monero.stackexchange.com/questions/8490/monero-genesis-transaction-nonce
> https://monero.stackexchange.com/questions/8468/how-can-i-get-my-own-genesis-tx-to-use-in-my-monero-fork
> https://monero.stackexchange.com/questions/8328/genesis-transaction-explanation

Change the names of the constructed programs using the CMAKE files



