# Mining Pool Setup
Note Created: 2022-04-05

# Pre-requisites
- Install Node.js
```text
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash
sudo apt-get install -y nodejs
```
- Install Redis
```text
sudo apt-get install redis-server
```

* libssl required for the node-multi-hashing module
  * For Ubuntu: `sudo apt-get install libssl-dev`

* Boost is required for the cryptoforknote-util module
  * For Ubuntu: `sudo apt-get install libboost-all-dev`
  
* libsodium  
  * For Ubuntu: `sudo apt-get install libsodium-dev`

## Create a new User
```bash
sudo adduser --disabled-password --disabled-login your-user
```
To login with this user : 
```
sudo su - your-user
```

# Change the package.json
Change the git lines to use https instead of git://

# Change lib/logger.js
> change the require cli-color-c to cli-color

Need to use node v12
npm rebuild
npm install

"daemon": {
        "host": "127.0.0.1",
        "port": 22222
    },
    "wallet": {
        "host": "127.0.0.1",
        "port": 22223,
        "password": "password"
    },

apiInterfaces line 14 change trtlecoin to BillyBucks


Commands 
./BillyBucksd --allow-local-ip --log-level 4 --enable-blockexplorer
./wallet-api --scan-coinbase-transactions --rpc-password password --log-level 4 --log-file apilog --enable-cors "*"

curl -X POST "http://127.0.0.1:22223/wallet/open" -H "accept: application/json" -H "X-API-KEY: password" -H "Content-Type: application/json" -d "{ \"daemonHost\": \"127.0.0.1\", \"daemonPort\": 22222, \"filename\": \"/home/billy/BillyBucks/PoolWallet.wallet\", \"password\": \"pool\"}"

~/MPool$ node init.js
sudo systemctl restart nginx
running at 1999
sudo nano /etc/nginx/nginx.conf


# COIN defined at:
CurrencyBuilder &CurrencyBuilder::numberOfDecimalPlaces



GETTING Hashrate could be defined as the spped at which the threshold is met. 
Therefore the slowest miner is always the one who go to the threshold the slowest (on average)
