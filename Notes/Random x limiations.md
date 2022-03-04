# Randomx limitations
> https://github.com/tevador/RandomX

Randomx is part of Moneros proof-of-work algorithm.
It was integrated in order to reduce the risk of botnets and crypto-jacking, It also reduced the efficiency of pre-existing ASICs.
## Primary problems for web based mining and Randomx
- RandomX utilises floating point math
- Most implementations of JS or Webassembly do not natively support floating point arithmetic
  - An addition to webassembly has been proposed to support this
- This means that mining on the browser is slow due to its lack of native support and also uses a lot of memory 2GB+

