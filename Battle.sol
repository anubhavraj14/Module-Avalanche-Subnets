// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract Battle {
    struct Player {
        address playerAddress;
        uint256 strength;
        uint256 battleCount;
        uint256 winCount;
    }

    mapping(address => Player) public players;

    event BattleResult(address indexed player1, address indexed player2, address winner);

    function register(uint256 _strength) external {
        require(players[msg.sender].playerAddress == address(0), "Player already registered");
        players[msg.sender] = Player(msg.sender, _strength, 0, 0);
    }

    function battle(address _opponent) external {
        require(players[msg.sender].playerAddress != address(0), "You must register first");
        require(players[_opponent].playerAddress != address(0), "Opponent must be registered");

        players[msg.sender].battleCount += 1;
        players[_opponent].battleCount += 1;

        address winner = _determineWinner(msg.sender, _opponent);
        players[winner].winCount += 1;

        emit BattleResult(msg.sender, _opponent, winner);
    }

    function _determineWinner(address _player1, address _player2) private view returns (address) {
        uint256 rand = uint256(keccak256(abi.encodePacked(block.timestamp, _player1, _player2))) % 2;
        return rand == 0 ? _player1 : _player2;
    }

    function getPlayer(address _player) external view returns (Player memory) {
        return players[_player];
    }
}
