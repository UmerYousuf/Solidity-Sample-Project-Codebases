// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DecentralizedVoting {
    // Structure to represent a single voting option
    struct Option {
        string name;
        uint256 voteCount;
    }

    // Mapping to store the list of options
    mapping(uint256 => Option) public options;

    // Mapping to track whether an address has voted or not
    mapping(address => bool) public hasVoted;

    // Event to be emitted when a vote is cast
    event VoteCasted(address indexed voter, uint256 indexed option);

    // Modifier to check if the voter has not voted before
    modifier hasNotVoted() {
        require(!hasVoted[msg.sender], "You have already voted");
        _;
    }

    // Constructor to initialize the voting options
    constructor(string[] memory optionNames) {
        require(optionNames.length > 0, "At least one option is required");

        for (uint256 i = 0; i < optionNames.length; i++) {
            options[i] = Option({name: optionNames[i], voteCount: 0});
        }
    }

    // Function to cast a vote for a specific option
    function vote(uint256 optionIndex) external hasNotVoted {
        require(optionIndex < options.length, "Invalid option index");

        // Mark the sender as voted
        hasVoted[msg.sender] = true;

        // Increment the vote count for the chosen option
        options[optionIndex].voteCount++;

        // Emit the VoteCasted event
        emit VoteCasted(msg.sender, optionIndex);
    }

    // Function to get the total vote count for a specific option
    function getVoteCount(uint256 optionIndex) external view returns (uint256) {
        require(optionIndex < options.length, "Invalid option index");

        return options[optionIndex].voteCount;
    }
}
