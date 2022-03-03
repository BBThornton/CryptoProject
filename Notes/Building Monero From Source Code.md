# Building Monero From Source Code
> https://github.com/monero-project/monero

## BUILD MONEROD
```
sudo apt-get update && sudo apt-get install g++ cmake git-core libgtest-dev -y && cd /usr/src/gtest && sudo cmake . && sudo make && sudo mv libg* /usr/lib/ && \
sudo apt-get install python-pip build-essential pkg-config libboost-all-dev libssl-dev libzmq3-dev libunbound-dev libsodium-dev libunwind8-dev liblzma-dev libreadline6-dev libldns-dev libexpat1-dev doxygen graphviz libpgm-dev qttools5-dev-tools libhidapi-dev libusb-1.0-0-dev libprotobuf-dev protobuf-compiler libudev-dev -y && \
mkdir ~/source && cd ~/source && git clone --recursive https://github.com/monero-project/monero && cd monero && git checkout release-v0.17 && git submodule sync && git submodule update && make -j$(nproc)
```

## Copy the built monero binarys to an application folder 
```
mkdir -p ~/app/monero
cp -r ~/source/monero/build/Linux/release-v0.17/release/bin/* ~/app/monero/
```

## Run Monero Code
> https://www.getmonero.org/resources/user-guides/vps_run_node.html
