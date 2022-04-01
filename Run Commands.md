# Run Commands
[[Monero]]
Code
```
./monerod --rpc-bind-ip 127.0.0.1 --rpc-bind-port 18081 --non-interactive --block-notify "/usr/bin/pkill -USR1 monero-pool" --bg-mining-enable --bg-mining-ignore-battery
./monero-wallet-rpc --daemon-host 127.0.0.1:18081 --trusted-daemon --disable-rpc-login --rpc-bind-port 18084 --wallet-file primary-wallet --password billy
./monero-pool
```
