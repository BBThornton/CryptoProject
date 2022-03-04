# TODO
Note Created: 2022-02-25

# Current Problems
## Testnet not functioning correctly.
### Issue
- The nodes are communicating with each other
- I believe the pool is communicating with one of the nodes
- But the miner is not successfully mining blocks despite a low mining difficulty
### Ideas
- Possible bad config of mining difficulty
- Pool might have a hard coded "mininmum difficulty" I dont know about.
- Testnet Nodes might be miss-configured
- **Possibly worth doing a full fork of the monero code (as opposed to the testnet fork system)**
  - This would involve making some code changes to remove the seed node pings, changing the network prefix and also changing the genesis block
  - **This would mean I could operate the "tetnet" as a full blockchain which would remove the additional abstraction however could lead to more complications**



# Goals
What proportion of hashes of shares, Will dictate how low you can go with? 

- Centralised billy bucks cryptocurrency
  - Setup mining pools
  - Test Reward function
- Modify mining pool Throttling, to limit rate of which shares can be accumulated.
  - Not limit the rate the shares are sent to the miner. Miners can consume many jobs.
- Configure miner to throttle hash rate which replicates the 