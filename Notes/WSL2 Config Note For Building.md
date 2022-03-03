# WSL2 Config Note For Building
Note Created: 2022-03-03
[[Monero]]
## Memory needs to be increased to Run and Build monero 
```
IN   /etc/security/limits.conf

billy   hard    memlock 2048
billy   soft    memlock 2048

su billy
```
