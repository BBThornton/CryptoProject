# TestNet
Note Created: 2022-02-24
test net allows for fixed difficulty to speed up mining
```
./monerod --rpc-bind-ip 127.0.0.1 --rpc-bind-port 18081 --non-interactive --block-notify "/usr/bin/pkill -USR1 monero-pool" --bg-mining-enable --bg-mining-ignore-battery --testnet --fixed-difficulty 0
```
```
./monero-wallet-rpc --daemon-host 127.0.0.1:18081 --trusted-daemon --disable-rpc-login --rpc-bind-port 18084 --wallet-file test-wallet --password test --testnet
```
```
./monero-pool
```


./monerod --testnet  --no-igd --hide-my-port --data-dir ~/testnet/node_01 --p2p-bind-ip 127.0.0.1 --log-level 1 --add-exclusive-node 127.0.0.1:38080 --fixed-difficulty 1


./monerod --testnet --p2p-bind-port 38080 --rpc-bind-port 18081 --zmq-rpc-bind-port 38082 --no-igd --hide-my-port  --log-level 0 --data-dir ~/testnet/node_02 --p2p-bind-ip 127.0.0.1 --add-exclusive-node 127.0.0.1:28080  --fixed-difficulty 1 --bg-mining-enable --bg-mining-ignore-battery 

### in testnet folder
../app/monero/monero-wallet-cli --testnet --password test


./monero-wallet-rpc --daemon-host 127.0.0.1:38081 --trusted-daemon --disable-rpc-login --rpc-bind-port 18084 --wallet-file ~/testnet/test-wallet --password test --testnet