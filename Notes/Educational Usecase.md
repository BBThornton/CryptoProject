# Educational Usecase
Note Created: 2022-03-04
[[ReadMe Summary]]
**Statement: Mining of a permissioned dedicated cryptocurrency for monetising educational content is novel, feasible and useful for encouraging student engagement whilst funding creators**

### Premise
By utilising a dedicated permissioned blockchain, and equal reward mining pools it is possible to directly reward content creators and encourage student engagement by offering a reward scheme. This is possible by utilising a content delivery client which is able to mine the dedicated cryptocurrency whilst content is being consumed.

# Architecture
## Components
### Seed Node / Central Blockchain
A central permissioned blockchain **Seed node** which is the central point all Nodes connect to to get the most recent blockchain history.
- This would be run by me or the hosting institution.

### Pools / Hosting software
A number of pools with permission to join the mining process. In a multi-institution application there could be a pool per institution which would reduce the bandwidth requirements of the seed node.

These pools would likely be included as part of a hosting software. Which allows institutions to administrate the owners of different content. However this could be a completely separate application with an API the pool software can interact with.

*Lecturer self hosting could also be possible by creating a request protocol that the client would use. This would ensure the student is using the mining client before access if allowed and also manage wallet addresses. A direct socket between the client and the pool host could then be returned*

These pools would utilise policies to decide the reward returned to students on course completion. Handle the work distribution.

### Client
The client would be an application that allowed students to interact with the network. Clients could be authenticated to prohibit mining by non client users.

The client would perform the mining whilst also serving as a gateway to the content.

This would most likely be a standalone application but could also be a web extension.

## Workflow/protocol
- Client -> Request for particular content -> Pool/Distribution Server
- Pool -> confirms contents existence, returns the content, and additional config packet -> client
  - The config packet would configure the client for mining
- Client -> open TCP port (stratum?) -> pool
- Pool -> Send Work -> client
- client -> shares -> pool
- Once the threshold number of shares is reached pool stops sending work
- Once the pool receives a chain reward distribute to the creators (hold percentage in pool wallet dependent on student reward percentage)

### Checks the protocol would have to make
- If no shares are being submitted then content should stop being delivered, unsure how current sites do that with static content.
- 
