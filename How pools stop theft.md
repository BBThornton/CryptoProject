# How pools stop theft
Note Created: 2022-02-01
# Resources
- https://bitcoin.stackexchange.com/questions/10687/what-prevents-a-pool-miner-from-stealing-an-entire-block
- https://bitcoin.stackexchange.com/questions/1338/how-is-block-solution-withholding-a-threat-to-mining-pools

The block job that the pool sends contains a coinbase transaction which includes the payment address (where the reward for block completion should be sent)

When a miner submits a share to the pool the pool *should* check that the coinbase address is correct (matches the pool) before considering it a correct share

The coinbase transaction is included when hashing the block therefore if you change the address in the transaction the hash will also change

Therefore if a miner get the block hash (eligible for the block reward), which contains the pools address, they cannot change the address (to their own) without rehashing the block.

This means that they cant cheat the system as submitting valid shares to the pool and valid blocks to the chain would require twice the amount of work