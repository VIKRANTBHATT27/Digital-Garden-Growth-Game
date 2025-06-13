// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DigitalGardenGrowthGame {
    
    // Struct to represent a plant
    struct Plant {
        uint256 id;
        string name;
        uint256 plantedTime;
        uint256 lastWatered;
        uint256 growthStage; // 0: Seed, 1: Sprout, 2: Growing, 3: Mature
        bool isHarvested;
        address owner;
    }
    
    // Plant types with different growth times (in seconds for testing)
    struct PlantType {
        string name;
        uint256 growthTime; // Time needed to reach maturity
        uint256 wateringInterval; // How often plant needs watering
        uint256 harvestReward; // Reward tokens for harvesting
    }
    
    // State variables
    mapping(address => uint256) public playerTokens;
    mapping(uint256 => Plant) public plants;
    mapping(uint256 => PlantType) public plantTypes;
    mapping(address => uint256[]) public playerPlants;
    
    uint256 public nextPlantId = 1;
    uint256 public totalPlantTypes = 0;
    
    // Events
    event PlantSeeded(address indexed player, uint256 indexed plantId, string plantName);
    event PlantWatered(address indexed player, uint256 indexed plantId);
    event PlantHarvested(address indexed player, uint256 indexed plantId, uint256 reward);
    event PlantTypeAdded(uint256 indexed typeId, string name);
    
    constructor() {
        // Initialize some basic plant types
        addPlantType("Tomato", 300, 60, 10); // 5 min growth, 1 min watering, 10 tokens
        addPlantType("Carrot", 180, 45, 8);  // 3 min growth, 45 sec watering, 8 tokens
        addPlantType("Lettuce", 120, 30, 5); // 2 min growth, 30 sec watering, 5 tokens
        
        // Give new players some starting tokens
        playerTokens[msg.sender] = 100;
    }
    
    // Core Function 1: Plant a seed
    function plantSeed(uint256 plantTypeId) external {
        require(plantTypeId < totalPlantTypes, "Invalid plant type");
        require(playerTokens[msg.sender] >= 5, "Need at least 5 tokens to plant");
        
        // Deduct planting cost
        playerTokens[msg.sender] -= 5;
        
        // Create new plant
        plants[nextPlantId] = Plant({
            id: nextPlantId,
            name: plantTypes[plantTypeId].name,
            plantedTime: block.timestamp,
            lastWatered: block.timestamp,
            growthStage: 0, // Start as seed
            isHarvested: false,
            owner: msg.sender
        });
        
        // Add to player's plants
        playerPlants[msg.sender].push(nextPlantId);
        
        emit PlantSeeded(msg.sender, nextPlantId, plantTypes[plantTypeId].name);
        nextPlantId++;
    }
    
    // Core Function 2: Water a plant
    function waterPlant(uint256 plantId) external {
        require(plants[plantId].owner == msg.sender, "Not your plant");
        require(!plants[plantId].isHarvested, "Plant already harvested");
        
        Plant storage plant = plants[plantId];
        plant.lastWatered = block.timestamp;
        
        // Update growth stage based on time passed
        updatePlantGrowth(plantId);
        
        emit PlantWatered(msg.sender, plantId);
    }
    
    // Core Function 3: Harvest a mature plant
    function harvestPlant(uint256 plantId) external {
        require(plants[plantId].owner == msg.sender, "Not your plant");
        require(!plants[plantId].isHarvested, "Plant already harvested");
        
        Plant storage plant = plants[plantId];
        
        // Update growth stage first
        updatePlantGrowth(plantId);
        
        require(plant.growthStage == 3, "Plant not mature yet");
        
        // Find plant type to get reward
        uint256 reward = 0;
        for(uint256 i = 0; i < totalPlantTypes; i++) {
            if(keccak256(bytes(plantTypes[i].name)) == keccak256(bytes(plant.name))) {
                reward = plantTypes[i].harvestReward;
                break;
            }
        }
        
        // Mark as harvested and give reward
        plant.isHarvested = true;
        playerTokens[msg.sender] += reward;
        
        emit PlantHarvested(msg.sender, plantId, reward);
    }
    
    // Helper function to update plant growth
    function updatePlantGrowth(uint256 plantId) internal {
        Plant storage plant = plants[plantId];
        
        // Find the plant type
        uint256 growthTime = 0;
        uint256 wateringInterval = 0;
        
        for(uint256 i = 0; i < totalPlantTypes; i++) {
            if(keccak256(bytes(plantTypes[i].name)) == keccak256(bytes(plant.name))) {
                growthTime = plantTypes[i].growthTime;
                wateringInterval = plantTypes[i].wateringInterval;
                break;
            }
        }
        
        uint256 timeSincePlanted = block.timestamp - plant.plantedTime;
        uint256 timeSinceWatered = block.timestamp - plant.lastWatered;
        
        // Check if plant is well-watered (watered within interval)
        if(timeSinceWatered <= wateringInterval) {
            // Plant grows normally
            if(timeSincePlanted >= growthTime) {
                plant.growthStage = 3; // Mature
            } else if(timeSincePlanted >= (growthTime * 2 / 3)) {
                plant.growthStage = 2; // Growing
            } else if(timeSincePlanted >= (growthTime / 3)) {
                plant.growthStage = 1; // Sprout
            }
        }
        // If not watered in time, growth slows down or stops
    }
    
    // Function to add new plant types (only contract owner)
    function addPlantType(string memory name, uint256 growthTime, uint256 wateringInterval, uint256 reward) internal {
        plantTypes[totalPlantTypes] = PlantType({
            name: name,
            growthTime: growthTime,
            wateringInterval: wateringInterval,
            harvestReward: reward
        });
        
        emit PlantTypeAdded(totalPlantTypes, name);
        totalPlantTypes++;
    }
    
    // View functions
    function getPlayerPlants(address player) external view returns (uint256[] memory) {
        return playerPlants[player];
    }
    
    function getPlantDetails(uint256 plantId) external view returns (Plant memory) {
        return plants[plantId];
    }
    
    function getPlayerTokens(address player) external view returns (uint256) {
        return playerTokens[player];
    }
    
    function getPlantType(uint256 typeId) external view returns (PlantType memory) {
        return plantTypes[typeId];
    }
    
    // Function to give tokens to new players (for testing)
    function claimStarterTokens() external {
        require(playerTokens[msg.sender] == 0, "Already claimed");
        playerTokens[msg.sender] = 50;
    }
}
