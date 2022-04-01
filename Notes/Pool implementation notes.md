# Pool implementation notes
Payee in xmr.js
https://www.reddit.com/r/MoneroMining/comments/mq1jx0/mining_pool/

/etc/security/limits.conf
billy   hard    memlock 2048
billy   soft    memlock 2048

su billy

Code
```
./monerod --rpc-bind-ip 127.0.0.1 --rpc-bind-port 18081 --non-interactive --block-notify "/usr/bin/pkill -USR1 monero-pool" --bg-mining-enable --bg-mining-ignore-battery
./monero-wallet-rpc --daemon-host 127.0.0.1:18081 --trusted-daemon --disable-rpc-login --rpc-bind-port 18084 --wallet-file primary-wallet --password billy
./monero-pool
```

Pool will open using the ubuntu ip
ifconfig to get ip
172.25.207.154
ip:4243

Change the pool config:
    Ports should be 1xxxxx and not 2xxxxx
    Pool wallet address needs to be what is opened by wallet rpc

# Mine in the pool 
Use xmrig with the following config
"pools": [
        {
            "algo": null,
            "coin": "monero",
            "url": "172.25.207.154:4242",
            "user": "42hNPEfZC1nQThR8GL3o9ANTkSQHsTrst4FaTeumj9riTUvNvYt5spG8Ki1E8T8RfTNxhfSRrL1eRUwPYT9Qi8yW1RmeXrL",
            "pass": "x",
            "rig-id": null,
            "nicehash": false,
            "keepalive": false,
            "enabled": true,
            "tls": false,
            "tls-fingerprint": null,
            "daemon": false,
            "socks5": null,
            "self-select": null,
            "submit-to-origin": false
        }
    ],

# CMDS to build pool and morenro
```
#BUILD MONEROD
sudo apt-get update && sudo apt-get install g++ cmake git-core libgtest-dev -y && cd /usr/src/gtest && sudo cmake . && sudo make && sudo mv libg* /usr/lib/ && \
sudo apt-get install python-pip build-essential pkg-config libboost-all-dev libssl-dev libzmq3-dev libunbound-dev libsodium-dev libunwind8-dev liblzma-dev libreadline6-dev libldns-dev libexpat1-dev doxygen graphviz libpgm-dev qttools5-dev-tools libhidapi-dev libusb-1.0-0-dev libprotobuf-dev protobuf-compiler libudev-dev -y && \
mkdir ~/source && cd ~/source && git clone --recursive https://github.com/monero-project/monero && cd monero && git checkout release-v0.17 && git submodule sync && git submodule update && make -j$(nproc)

#BUILD MONERO-POOL
export MONERO_ROOT=~/source/monero && sudo apt-get install xxd liblmdb-dev libevent-dev libjson-c-dev uuid-dev -y && cd ~/source && git clone https://github.com/jtgrassie/monero-pool.git && cd monero-pool && make release

#move stuff around
mkdir -p ~/app/monero
mkdir -p ~/app/monero-pool
cp -r ~/source/monero-pool/build/release/* ~/app/monero-pool/ 
cp -r ~/source/monero/build/Linux/release-v0.17/release/bin/* ~/app/monero/
```
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
