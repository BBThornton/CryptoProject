# Sybil Attacks
Fancy Name for boting on decentralised networks

A problem on all decentralised networks.
The cost of proof of work and proof of stake partly act as a sybil attack prevention method however this wont work for my "reduced proof-of-work" solution

## Why its a problem for me
By rewarding all users in the pool equally it allows me to reduce the difficulty of proof of work. 

This is done by putting a threshold number of shares miners need to submit and then throttling further mining.

This reduces the "competition" aspect of proof-of-work as once a miner has submitted the threshold number of shares there is no incentive to mine further.

The primary benefit of this approach is that the difficulty of mining can be scaled based on the hash rate of the lowest powered devices on the network as mining acts as a proof of time instead of a consensus method (as the chain is permissioned and "centralised")

**The reduced difficulty however poses a problem where by users can bot their own courses to generate cryptocurrency.**


# Solution 1 - User authentication
Ensuring that both content creators and miners are authenticated is one method of avoiding the bot problem (Although no perfect solution exists)
This is the basis of proof-of-[[Personhood]]