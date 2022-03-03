# Mining Pool Theory
Mining pools function by allowing users to pool their resources to increase their individual mining rewards.

## Shares
Shares are utilised as a method to ensure users in the pool are actually mining (attempting to solve the blockchain problem).
The difficulty of the share problem is less than that of the blockchain it belongs to:
- If the Monero blockchain difficulty is currently 10
- Then a mining pools share difficulty could be 8
- This means that users can complete the share problem easier than the blockchain problem, encouraging them to use the pool instead of just mining the blockchain solo. 
- By submitting a share they are also submitting proof that they are attempting so solve the problem

### A share solution can also be a blockchain solution
Any given share may also be a solution to the blockchain problem *(a solution of difficulty 10)*. 
When a user submits a share the shares are verified, to check they are above the share difficulty threshold and also to see if they are a blockchain solution.
If they are a blockchain solution then the solution is submitted to the chain and the reward distributed to all the pools miners according to the pools [reward function](#reward-functions)

## Coordinators - Sharing the work load
Mining pools often utilise coordinators which ensure that miners are performing different tasks, so that mining power is not wasted.
They do this by separating the search space into different sections and sending those sections to different miners. 
In practice this involves sending *jobs* to miners, where each job contains a different potential **nonce** (the variable which is brute forced during the mining process).
Jobs also contain meta data to stop [[How pools stop theft|theft]]

## Reward functions
PPLNS : pay per last n shares.
Rewards users based on how many shares they have submitted in the last N shares (this means that users which do more work are rewarded more favourably)