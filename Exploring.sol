// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Explore {
    struct Explorer {
        address explorerAddress;
        uint256 exploreCount;
        uint256 totalRewards;
    }

    mapping(address => Explorer) public explorers;
    address[] public explorerAddresses; 

    event ExplorationResult(address indexed explorer, uint256 reward);

    function register() external {
        require(explorers[msg.sender].explorerAddress == address(0), "Explorer already registered");
        explorers[msg.sender] = Explorer(msg.sender, 0, 0);
        explorerAddresses.push(msg.sender); 
    }

    function explore() external {
        require(explorers[msg.sender].explorerAddress != address(0), "You must register first");

        explorers[msg.sender].exploreCount += 1;

        uint256 reward = _determineReward();
        explorers[msg.sender].totalRewards += reward;

        emit ExplorationResult(msg.sender, reward);
    }

    function _determineReward() private view returns (uint256) {
        return uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender))) % 100;
    }

    function getExplorer(address _explorer) external view returns (Explorer memory) {
        return explorers[_explorer];
    }

    
    function getExplorerCount() external view returns (uint256) {
        return explorerAddresses.length;
    }

    function getTopExplorers(uint256 limit) external view returns (Explorer[] memory) {
        require(limit > 0 && limit <= explorerAddresses.length, "Invalid limit");

        Explorer[] memory topExplorers = new Explorer[](limit);
        uint256[] memory rewards = new uint256[](explorerAddresses.length);


        for (uint256 i = 0; i < explorerAddresses.length; i++) {
            rewards[i] = explorers[explorerAddresses[i]].totalRewards;
        }


        _sortDescending(rewards, explorerAddresses);

   
        for (uint256 i = 0; i < limit; i++) {
            topExplorers[i] = explorers[explorerAddresses[i]];
        }

        return topExplorers;
    }


    function _sortDescending(uint256[] memory data, address[] memory addresses) private pure {
        uint256 len = data.length;
        for (uint256 i = 0; i < len; i++) {
            for (uint256 j = i + 1; j < len; j++) {
                if (data[i] < data[j]) {
                    
                    (data[i], data[j]) = (data[j], data[i]);
                 
                    (addresses[i], addresses[j]) = (addresses[j], addresses[i]);
                }
            }
        }
    }

    function getAllExplorers() external view returns (address[] memory) {
        return explorerAddresses;
    }
}
