# Pool implementation notes
Payee in xmr.js

# Set up and sync monero
> https://www.getmonero.org/resources/user-guides/vps_run_node.html

### To build the pool you need the source code
> https://github.com/monero-project/monero#compiling-monero-from-source
```
sudo apt-get install libgtest-dev && cd /usr/src/gtest && sudo cmake . && sudo make
sudo mv lib/libg* /usr/lib/

sudo apt update && sudo apt install build-essential cmake pkg-config libssl-dev libzmq3-dev libunbound-dev libsodium-dev libunwind8-dev liblzma-dev libreadline6-dev libldns-dev libexpat1-dev libpgm-dev qttools5-dev-tools libhidapi-dev libusb-1.0-0-dev libprotobuf-dev protobuf-compiler libudev-dev libboost-chrono-dev libboost-date-time-dev libboost-filesystem-dev libboost-locale-dev libboost-program-options-dev libboost-regex-dev libboost-serialization-dev libboost-system-dev libboost-thread-dev ccache doxygen graphviz

git clone --recursive https://github.com/monero-project/monero

cd monero
git checkout release-v0.17
make -j12
```

# Build the pool
> https://github.com/jtgrassie/monero-pool/tree/master
> cd monero-pool
> export MONERO_ROOT=~/monero
> make release

# Commands
in the ~/monero dir
> ./monerod --detach
> tail -f ~/.bitmonero/bitmonero.log

in the ~/monero-pool/build/release
> ./monero-pool

# Pool config settings
|Config|Description|
|---|---|
pool-port|	the port your miners connect to
rpc-host|	the IP of your monerod
rpc-port|	the daemon RPC port
rpc-timeout|	timeout in seconds for daemon RPC calls
wallet-rpc-host|	the IP of your monero-wallet-rpc
wallet-rpc-port|	the port of your monero-wallet-rpc
pool-wallet|	the monero address of your pool wallet (the wallet loaded in your monero-wallet-rpc)
pool-start-diff|	the initial target for new miner connections
share-mul|	the PPLNS share multiplier
pool-fee|	fee deducted for the pool from any mined blocks
payment-threshold|	minimum XMR a miner has to accumulate before the pool pays them
log-level|	log level (0 least logging to 5 most logging)
webui-port|	the port of the pools web interface
