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



TODO
GCP IS WORKING
The reason I am Having issues is due to the allo-local-ip param not working
Ive added alot of std:cout << calls to rtry and debug
Also see comments //BT Changed From False    			 and similar
TRY AND FIX THE FROM LOCAL IP ISSUE


./BillyBucksd --allow-local-ip --log-level 4 --seed-node 192.168.1.111:17654
./BillyBucksd --allow-local-ip --log-level 4 --p2p-bind-port 17654 --p2p-external-port 17654 --seed-node 192.168.1.113:17653


./BillyBucksd --allow-local-ip --log-level 4 --p2p-bind-port 17653 --p2p-external-port 17653 --seed-node 192.168.1.111:17653

./BillyBucksd --allow-local-ip --log-level 4 --seed-node 192.168.1.111:17653


./BillyBucksd --allow-local-ip --log-level 4 --add-exclusive-node 192.168.1.117:22221
./BillyBucksd --allow-local-ip --log-level 4 --add-exclusive-node 192.168.1.118:22221



SETTING UP TURTLE COIN FORK
CLEAR THE CHECKPOINTS IN config/CrypotNodeCheckpoints.h

IN CRYPTO_NOTE_CONFIG.h
	Change the Difficulty_Target
		Number of seconds top mine a block (AVG)
	Change the CRYPTONOTE_Public_Address_Base58_Prefix
		This is the letter prefix for wallet address that will be at the start I used (BT)
		The cryptonote site has a tool for creating these
	Change the mined money window
		This determines how many blocks need to pass for rewards to enter wallets
		Time = This_value * Difficulty_Target(seconds)
	Changed th eZAWY_Difficulty_Block_index
		This determines what block the difficulty function is upgraded.
		Set this to 0 to use the best/newest function out of the gate
	Change the LWMA_2_Difficulty_Block_index
		These should increment from 1 -> 3
	Change the GENESIS_COINBASE_TX_HEX
		This is generated after compiuling the source code and running with the --print-gensis-tx
	Change the MIXIN_limits_Vx_heights 
		to 0, 1, 2 (incrementing by 1)
	Change the UPGRADE_HEIGHT_Vx
		Can just increment by 1 or bigger bounds to give more time using older functions
		Older mining functions allowed ASICS
	Delete the FORK_HEIGHTS
	Change the doftware supported fork index
		to 0
	Cahnged the Crypto_Name
	Change the Ports to something different
	Change the CRYPTONOTE_NETWORK
		To a random list of hex (must be the same length as whats already there)
	Change the seed nodes

In WalletConfig
	Change the address prefix
		Should be the same as the prefix used in the above config (in ascii)
		This is case sensitive
	Change the Ticker
		This can be anything
	Change the daemonName
		This is whatever the compiled Daemon is called
	Change the walletdName
		This is the name of the service (can be anything)
	Might need to change the standardAddressLength
		You can test this by compiling the code and then running the wallet program
		Create a new wallet -> use the address in the miner: Should complain if the length is incorrect

In Version.h.in
	Change the PROJECT_NAme
		To the name of the coin
	Change the Major and Minor versions (0)

FIX THE DaemonConfiguration.cpp file
	on line 310 the param is called local-ip this should be called allow-local-ip
	as should the value on line 312
	This allows you to use the --allow-local-ip config option



Copy the Code to 2 seed nodes
The seednodes should point to eachother (in the config) but should not include themselves

Run each see node using the following command, Log level can be changed
./BillyBucksd --allow-local-ip --log-level 4

Now run two indidendant nodes with the following commands
./BillyBucksd --allow-local-ip

print_pl can be used to see if the two nodes have connected to eachother via the seed nodes

To test mining synchronisation do the following:
Run ./zedwallet and generate a new wallet
Use the utility to print the wallet address
Use the wallet address when running ./miner