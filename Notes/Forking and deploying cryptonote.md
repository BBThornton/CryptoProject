# Forking and deploying cryptonote

https://cryptonotestarter.org/inner.html

> git clone https://github.com/cryptonotefoundation/cryptonote.git

---
## Building Dependency's/Instructions

### **Dependency's**
GCC/CMake/BOOST
GCC
> sudo apt install build-essential 

CMake
> sudo apt install cmake

BOOST
> sudo apt-get install libboost-all-dev

### Build Commands (From root DIR)
> make -j\<number of threads>

> make build-debug

---

## Custom Reward Function (if needed)
[[Block Reward Formula]]

---
## Cryptonote Config.h

### Name must be specified:
Line 76:
const char CRYPTONOTE_NAME[] = "billybucks";

### Total Money Supply (18446744073709551616):
line 27:
const uint64_t MONEY_SUPPLY = (uint64_t)(-1);

### Emission Curve (18)
line 28:
const unsigned EMISSION_SPEED_FACTOR = 18;

### Difficulty target (Target block addition speed) - 120
line 42:
const unsigned EMISSION_SPEED_FACTOR = 18;

### Set Ports
line 88:
const int P2P_DEFAULT_PORT = 17236;
line 90:
const int RPC_DEFAULT_PORT = 18236;

### Seed Nodes (need to be changed to the IP of the constant server)
line 109:
const std::initializer_list<const char*> SEED_NODES = {
  "111.11.11.11:17236",
  "222.22.22.22:17236",
};

### Minimum transaction fee
line 38:
const uint64_t MINIMUM_FEE = 100000;

### Penalty free block size
line 33:
const size_t CRYPTONOTE_BLOCK_GRANTED_FULL_REWARD_ZONE = 10000;

### Address Prefix (all wallet addresses begin with this): BT
[Generator](https://cryptonotestarter.org/inner.html)
const uint64_t CRYPTONOTE_PUBLIC_ADDRESS_BASE58_PREFIX = 0x5150

---


## Network identifier — src/P2p/P2pNetworks.h
This identifier is used for network packages in order not to mix two different cryptocoin networks. Change all bytes to random values for your network:
const static boost::uuids::uuid CRYPTONOTE_NETWORK = { { 0xA1, 0x1A, 0xA1, 0x1A, 0xA1, 0x0A, 0xA1, 0x0A, 0xA0, 0x1A, 0xA0, 0x1A, 0xA0, 0x1A, 0xA1, 0x1A } };


```
— in src/CMakeList.txt file — set_property(TARGET daemon PROPERTY OUTPUT_NAME "YOURCOINNAMEd")
Line 83:
set_property(TARGET daemon PROPERTY OUTPUT_NAME "BillyBucksd")
```

