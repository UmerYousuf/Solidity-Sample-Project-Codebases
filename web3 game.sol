// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RockPaperScissors {
    // Enum to represent the possible moves in the game
    enum Move {None, Rock, Paper, Scissors}

    // Mapping to store the address of each player and their chosen move
    mapping(address => Move) public playerMoves;

    // Mapping to store the balance of each player
    mapping(address => uint256) public playerBalances;

    // Event to be emitted when a game is played
    event GamePlayed(address indexed player, Move playerMove, address indexed opponent, Move opponentMove, string result);

    // Function to play a move in the game
    function playMove(Move move) external {
        require(move == Move.Rock || move == Move.Paper || move == Move.Scissors, "Invalid move");

        // Ensure the player has not played before
        require(playerMoves[msg.sender] == Move.None, "You have already played");

        // Set the player's move
        playerMoves[msg.sender] = move;
    }

    // Function to determine the winner and distribute rewards
    function determineWinner(address opponent) external {
        require(playerMoves[msg.sender] != Move.None, "You haven't played yet");
        require(playerMoves[opponent] != Move.None, "Your opponent hasn't played yet");

        // Get the moves of the players
        Move playerMove = playerMoves[msg.sender];
        Move opponentMove = playerMoves[opponent];

        // Determine the winner and update balances
        if ((playerMove == Move.Rock && opponentMove == Move.Scissors) ||
            (playerMove == Move.Paper && opponentMove == Move.Rock) ||
            (playerMove == Move.Scissors && opponentMove == Move.Paper)) {
            // Player wins
            playerBalances[msg.sender] += 1;
            playerBalances[opponent] -= 1;

            emit GamePlayed(msg.sender, playerMove, opponent, opponentMove, "You win!");
        } else if (playerMove == opponentMove) {
            // It's a draw
            emit GamePlayed(msg.sender, playerMove, opponent, opponentMove, "It's a draw!");
        } else {
            // Player loses
            playerBalances[msg.sender] -= 1;
            playerBalances[opponent] += 1;

            emit GamePlayed(msg.sender, playerMove, opponent, opponentMove, "You lose!");
        }

        // Reset the moves for both players
        playerMoves[msg.sender] = Move.None;
        playerMoves[opponent] = Move.None;
    }

    // Function to check the balance of the player
    function getBalance() external view returns (uint256) {
        return playerBalances[msg.sender];
    }
}
