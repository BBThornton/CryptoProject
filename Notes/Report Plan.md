# Report Plan
Note Created: 2022-03-24
[[ReadMe Summary]]

# Introduction
- Summary of the literature review capturing the key points as follows
  - Brief intro into browser based mining and its potential use as a monetisation method that is preferable to pre-existing methods i.e. subscription/freemium/ads
  - Current blockchain/cryptocurrency technology is not inducive to browser based mining due to its scalability issues (mining difficulty increases) when a currency user base grows. Blocking easy access to the mining system. **Hardware Inequality problem**.
  - Brief Description of some potential use cases (Educational platform, opensource project funding/attribution of ownership)
    - For these applications to be feasible the mining methods of cryptocurrencies need to be improved, to provide stability and increase scalability without restricting content access.
  - This report outline a dedicated decentralised cryptocurrency that is only minable via a permissioned pool... providing the stability and accessibility these applications require 
- Numbered table of the project goals (for reference in the evaluation section of the report)
- Review/State the purpose of the proposed solution
  - To support a browser based mining ecosystem(s) by allowing users to have access to content for "free" where the *price* paid is the mining of the cryptocurrency, which is rewarded directly to the content host.
# A summary of the literature review and project spec (Part of markscheme)
- I will take the following sections?
  - Section 1.2 (cryptocurrencies and Browser based mining)
  - The summary section of consensus algorithms
  - Summary of mining pool section
  
 ---

 # V Model
# Requirements Analysis (MS: Specification *would also be used at the end for evaluation*)
Describe the content monetisation use case (high level) to preface the rest of the paper (THIS WOULD LIKELY BE PART OF THE INRO)
Discuss the primary requirements of the system wrapping them in the associated theory i.e.
- Mining needs to be possible in the browser on low powered devices
  - Discuss that most of internet access is done through low powered device not capable of competitively partaking in the mining of pre-existing cryptocurrencies
- Mining needs to be throttled to address the hardware inequality problems and provide stability
  - Would discuss the volatile nature of cryptocurrencies and how they are linked to the hardware inequality problems of PoW mining
- The mining process must be permissioned allowing the mining to only be used for the use case of content monetisation. Again providing stability and also allows mining to be used as a proxy for user engagement.
- Rewards (for the creators/miners) need to be decoupled from the hardware the miner is using
  - Discuss how the amount of reward a content creator gets should scale based on number of engaged users and not the hardware spec of the users.

# System/Architectural Design (MS: Design)
**Could throw in a system test plan here**
This would be the theoretical design (The theoretical white paper)
Discuss the mining pool and permission, system. 
Each part would be linked back to a system requirement
## Overview Of Design
- Open with an architecture image detailing:
  - The blockchain network (highly abstracted, just some nodes connected together)
  - The mining pool
  - The authentication server
  - Browser clients connected to the mining pool (perhaps noting different use cases)
- Description of how the components work together
  - Mention that I am using PoW

## Mining Pool Details
- Mining pool is the key component which changed how my system works compared to typical blockchain infrastructures
### Reward Function & mining Throttling
- In order to allow low powered devices to be able to feasibly "compete" in the POW mining process (and decouple the hardware from the rewards) The mining pool operates a custom reward Function
- Details of reward function (possibly some space for a mathematical formula here just to look clever haha)
  - Miners are able to mine in the pool until they submit a threshold number of shares (shares would hopefully be adequately explained in the lit review summary section)
  - Once that threshold has been reached they become eligible for the reward (of course this goes to the content creator so might need to find a better way of wording this)
    - Once this threshold has been met they will not receive any additional reward if they continue mining, thus there is no incentive to do so
  - The reward that the content creator receives is a proportion of the total block reward based on the number of users that mined "for them" during the block cycle
  - Once a miner submits a block solution to the pool, the pool verifies the hash and submits it to the blockchain, Receiving the block reward, which is then distributed according to the reward function (outlined above)
  - This decouples the hardware quality/power from the mining process as within any particular block cycle any one user is caped to the threshold
- This process allows PoW mining to be a measure of engagement, a proxy for a proof of time, with time spend mining = time spent using the resource.
### Permissioned & authenticated (Security)
- This is only possible as the mining pools are controlled by a central authority and mining is only possible via those pools. This means PoW is not responsible for block consensus as that is the role of the "trusted" mining pool nodes
- This is what allows the alteration to the mining incentives
- Mining nodes can only be accessed when miners have been authenticated via a "typical" authentication server. This ensures that mining/rewards can be accurately used to monitor engagement as mining is only possible when engaging with content.(Via the authentication portal)

# Module Design and Coding Phase (MS: Product and Fitness for Purpose)
Here I would discuss the actual implementation process
- Forking of a cryptocurrency and the devops pipeline
- The major changes to the pool logic
  - Here I could formalise some of the logic as a flow chart to demonstrate how the pool code works

# Unit/Integration testing (MS: Testing/Experimental)
- Can discuss the unit tests that run when the blockchain is build
  - Can also write some tests for the mining pool code
- Can write a test plan for the Integration testing, testing the communication between miners and pools, pools and nodes and nodes and the Chain
  - Here could also be the place to test that rewards go to creator wallets and not miner wallets

# System/Acceptance Testing (MS: Testing & results and evaluation)
Here would present the results that verify the initial requirements of the system spec.
- Graphs demonstrating the throttled mining speeds
- Chart that show that lower spec devices provide the same (or similar) levels of currency to creators as higher spec
- etc.

# Results & Evaluation
Discuss that I met the system requirements
Mention the possible setbacks for a full system roll out
## Security Concerns (Threat Modelling)
- Potentially talk about the Sybil attack/bot issue...
- With some proposed solution, Chain of trust, Network analysis

# Discussion/Conclusion
try to "justify" the primary contributions of the project
*Use lots of flashy words like "novel approach" to hammer home that my contributions are progressing the field*
Both the theoretical design and practical implementation of:
- Demonstrated an new blockchain framework that could be used to support monetisation of open content
- Made possible by a new variation on mining pools which utilise traditional user authentication
- And a new reward function which decouples hardware performance from the mining reward, and thus can be used as a method of measuring resource engagement
- A novel approach to mining difficulty management, utilising permissioned systems, in order to allow low powered hardware to actively engage in the mining process
- A web based platform which is able to allow users to mine as part of this system, but **most importantly** rewards the creators directly and not the miners themselves
## Conclude
Future works, happy dance

# MS: Process
Covered by the whole document by following a slightly butchered version of the V-Model
