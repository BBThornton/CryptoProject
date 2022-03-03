# Building Monero Pool Written In C
> https://github.com/monero-project/monero#compiling-monero-from-source
## BUILD MONERO-POOL
```
export MONERO_ROOT=~/source/monero && sudo apt-get install xxd liblmdb-dev libevent-dev libjson-c-dev uuid-dev -y && cd ~/source && git clone https://github.com/jtgrassie/monero-pool.git && cd monero-pool && make release
```

## Move build binaries to an application folder
```
mkdir -p ~/app/monero-pool
cp -r ~/source/monero-pool/build/release/* ~/app/monero-pool/ 
```

## Configure the pool (pool conf in built binaries)
Ports should be 1xxxxx and not 2xxxxx (by default)
Pool wallet address needs to be what is opened by wallet rpc (when opening the pool configured wallet)

## Run the pool 
> ./monero-pool

## Notes when running with WSL2
Pool will open using the ubuntu ip of WSL2 not localhost
Get the ip Via
> ifconfig

The ip or my setup is
> 172.25.207.154

Port for the web ui = 4243

## Pool config settings
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