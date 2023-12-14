// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery {
    address public manager; // Address of the manager who creates the lottery
    address[] public participants; // Array to store the addresses of participants
    address public winner; // Address of the winner

    // Event to be emitted when a participant enters the lottery
    event ParticipantEntered(address indexed participant);

    // Event to be emitted when a winner is selected
    event WinnerSelected(address indexed winner);

    // Modifier to restrict access to the manager
    modifier restricted() {
        require(msg.sender == manager, "Only the manager can call this function");
        _;
    }

    // Constructor to set the manager as the contract deployer
    constructor() {
        manager = msg.sender;
    }

    // Function for participants to enter the lottery by sending ether
    function enter() public payable {
        require(msg.value > 0, "You must send some ether to enter");

        // Add the participant to the array
        participants.push(msg.sender);

        // Emit the ParticipantEntered event
        emit ParticipantEntered(msg.sender);
    }

    // Function for the manager to pick a winner randomly
    function pickWinner() public restricted {
        require(participants.length > 0, "No participants in the lottery");

        // Select a random index as the winner
        uint256 index = random() % participants.length;
        winner = participants[index];

        // Transfer the entire contract balance to the winner
        payable(winner).transfer(address(this).balance);

        // Reset the participants array
        participants = new address[](0);

        // Emit the WinnerSelected event
        emit WinnerSelected(winner);
    }

    // Function to generate a pseudo-random number based on current block information
    function random() private view returns (uint256) {
        return uint256(keccak256(abi.encodePacked(block.difficulty, block.timestamp, participants)));
    }

    // Function to get the current balance of the lottery contract
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    // Function to get the addresses of participants
    function getParticipants() public view returns (address[] memory) {
        return participants;
    }
}
