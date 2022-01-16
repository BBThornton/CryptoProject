# Pool implementation notes
Payee in xmr.js
# Possible options
After exploring possible implementations a short list of the following has been created:
- https://github.com/jtgrassie/monero-pool
- https://github.com/MoneroOcean/nodejs-pool
- https://github.com/moneromint/solo-pool

# Installing on RPI
[Installing the Node-js pool](https://github.com/MoneroOcean/nodejs-pool)
Also need to install the monero dependencies from the [Monero Github](https://github.com/monero-project/monero#compiling-monero-from-source)
Can be done using the command
> sudo apt update && sudo apt install build-essential cmake pkg-config libssl-dev libzmq3-dev libunbound-dev libsodium-dev libunwind8-dev liblzma-dev libreadline6-dev libldns-dev libexpat1-dev libpgm-dev qttools5-dev-tools libhidapi-dev libusb-1.0-0-dev libprotobuf-dev protobuf-compiler libudev-dev libboost-chrono-dev libboost-date-time-dev libboost-filesystem-dev libboost-locale-dev libboost-program-options-dev libboost-regex-dev libboost-serialization-dev libboost-system-dev libboost-thread-dev ccache doxygen graphviz

