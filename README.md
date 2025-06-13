# Digital Garden Growth Game

## Project Description

Digital Garden Growth Game is a blockchain-based virtual gardening game built on Ethereum using Solidity smart contracts. Players can plant seeds, nurture their plants by watering them regularly, and harvest mature crops to earn rewards. The game combines the joy of gardening with blockchain technology, creating a decentralized gaming experience where players truly own their virtual garden.

The game features different types of plants (Tomato, Carrot, Lettuce) with varying growth times, watering requirements, and harvest rewards. Players need to manage their time and resources effectively to maintain a thriving garden while earning tokens that can be used to plant more seeds.

## Project Vision

Our vision is to create an engaging, educational, and rewarding gaming experience that introduces users to blockchain technology through familiar and enjoyable gardening mechanics. We aim to build a sustainable gaming ecosystem where:

- Players learn about responsibility and time management through plant care
- The gaming experience is truly decentralized and player-owned
- Users can earn real value through skillful gameplay and dedication
- The barrier to entry remains low while providing depth for experienced players
- Community features foster collaboration and knowledge sharing among players

## Key Features

### 🌱 **Plant Variety System**
- Multiple plant types with unique characteristics
- Different growth times (2-5 minutes for testing)
- Varying watering intervals and harvest rewards
- Strategic choice in plant selection based on available time

### 💧 **Dynamic Watering Mechanism**
- Plants require regular watering to grow properly
- Growth slows or stops if plants aren't watered on time
- Real-time growth tracking based on blockchain timestamps
- Encourages regular player engagement

### 🎯 **Progressive Growth Stages**
- Four distinct growth stages: Seed → Sprout → Growing → Mature
- Visual progression that rewards patient players
- Only mature plants can be harvested for maximum rewards

### 🏆 **Token Economy**
- Earn tokens by successfully harvesting mature plants
- Spend tokens to plant new seeds (5 tokens per seed)
- Balanced economy that rewards active and skilled players
- Starter tokens provided to new players

### 📊 **Player Management**
- Track all plants owned by each player
- View detailed plant information and growth status
- Monitor token balance and transaction history
- Personal garden portfolio management

### 🔍 **Transparency & Ownership**
- All game data stored on blockchain
- True ownership of virtual plants and tokens
- Transparent game mechanics and rules
- Immutable game history and achievements

## Future Scope

### Short-term Enhancements (3-6 months)
- **Seasonal Events**: Special limited-time plants with unique rewards
- **Plant Breeding**: Combine mature plants to create new varieties
- **Weather System**: Random events that affect plant growth
- **Achievement System**: Unlock badges and titles for various milestones

### Medium-term Features (6-12 months)
- **Marketplace Integration**: Trade plants and seeds with other players
- **Guild System**: Join communities and participate in group challenges
- **Land Ownership**: Purchase and customize virtual garden plots
- **NFT Integration**: Convert rare plants into tradeable NFTs

### Long-term Vision (1-2 years)
- **Mobile App**: Cross-platform mobile application with push notifications
- **Advanced Genetics**: Complex plant breeding with inherited traits
- **Real-world Integration**: Partner with actual seed companies for real plant rewards
- **Metaverse Compatibility**: 3D virtual gardens in VR/AR environments
- **DAO Governance**: Community-driven game development and rule changes
- **Cross-chain Support**: Expand to multiple blockchain networks

### Technical Improvements
- **Gas Optimization**: Reduce transaction costs through batch operations
- **Layer 2 Integration**: Move to Polygon or other L2 for faster, cheaper transactions
- **Oracle Integration**: Real weather data affecting virtual plant growth
- **Advanced Analytics**: Player behavior insights and game balancing tools

### Community Features
- **Social Elements**: Friend systems, plant gifting, and social competitions
- **Educational Content**: Real gardening tips and agricultural knowledge
- **Charity Integration**: Donate tokens to real-world agricultural projects
- **Leaderboards**: Seasonal competitions and global player rankings

---

## Getting Started

### Prerequisites
- Node.js and npm installed
- Hardhat or Truffle development environment
- MetaMask or other Web3 wallet
- Test ETH for deployment and transactions

### Installation
1. Clone the repository
2. Install dependencies: `npm install`
3. Compile contracts: `npx hardhat compile`
4. Deploy to testnet: `npx hardhat run scripts/deploy.js --network testnet`
5. Interact with the contract through Web3 interface

### Basic Gameplay
1. Claim starter tokens using `claimStarterTokens()`
2. Plant a seed using `plantSeed(plantTypeId)`
3. Water your plants regularly using `waterPlant(plantId)`
4. Harvest mature plants using `harvestPlant(plantId)`
5. Use earned tokens to plant more seeds and expand your garden

---

*Happy Gardening! 🌻*

Contract Address: 0x4eBD4F3B86FA3B94e5Ab6907bd422673e7CFc859

![image](https://github.com/user-attachments/assets/1cdf0ed2-68b3-4c5f-895c-43f163e873e2)
