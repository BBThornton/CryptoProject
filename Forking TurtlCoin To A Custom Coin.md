# Forking TurtlCoin To A Custom Coin
[[Monero]]
Note Created: 2022-04-05
[Trtl Repo](https://github.com/turtlecoin/turtlecoin)


# Running Compiled code
If using VM and bridge networks ensure that you use --allow-local-ip without any connection from 192.168.x.x will be ignored by the daemon. [[Hyper-V Test-net Setup]]

Run a daemon (allowing local ip connections)

    ./BillyBucksd --allow-local-ip --log-level 4

Run a wallet (enabling mining rewards to be displayed)

    ./zedwallet --log-level 4 --scan-coinbase-transactions

Run the miner

    ./miner


# Seed Nodes
Seed nodes are used to allow nodes to initially discover each other
These should be run on dedicated servers with their IP's included in the config as detailed below
Seed nodes can point to other seednodes but should not point to themselves. **Not a breaking issue but will cause looping and log spam**

# Compilation pre-requisites
> https://github.com/turtlecoin/turtlecoin/blob/v1.0.0/COMPILE.md
## Linux

##### Linux Dependencies

**Note:** Individual names for these packages may differ depending on your Linux distribution.

-   [Boost](https://www.boost.org/)
-   [OpenSSL](https://www.openssl.org/)
-   [Cmake (3.8, higher)](https://cmake.org/download/)
-   [GNU Make](https://ftp.gnu.org/gnu/make/)
-   [Git](https://git-scm.com/)
-   [GCC 7, higher](https://gcc.gnu.org/) or [CLANG 6, higher](https://clang.llvm.org/)

##### Ubuntu with GCC

-   `sudo apt update`
-   `sudo apt install -y libboost-all-dev libssl-dev gcc-8 g++-8 cmake`
-   `export CC=gcc-8`
-   `export CXX=g++-8`
-   `git clone -b master --single-branch https://github.com/turtlecoin/turtlecoin`
-   `cd turtlecoin`
-   `mkdir build`
-   `cd build`
-   `cmake ..`
-   `make`

The binaries will be in the `src` folder when you are complete.

-   `cd src`

# Setting Up The Fork Code
## Config/CryptoNodeCheckpoints.h
    CLEAR THE CHECKPOINTS
## Config/CryptoNoteConfig.h
```text
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
```
## Config/WalletConfig.h
```text
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
```
## Version.h.in
```text
Change the PROJECT_NAme
    To the name of the coin
Change the Major and Minor versions (0)
```

## FIX THE DaemonConfiguration.cpp file
```
on line 310 the param is called local-ip this should be called allow-local-ip
as should the value on line 312
This allows you to use the --allow-local-ip config option
```