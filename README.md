# Solidity-Sample-Project-Codebases
I frequently push my recent sample smart contract for a better understanding of hunters!

WEB 3.0 GAME - ROCK PAPER SCISSORS DESCRIPTION:

1. Enum for Moves: We use an enumeration to represent the possible moves in the game (Rock, Paper, Scissors).
2. Mappings for Player Moves and Balances: The contract uses mappings to store the moves and balances of each player.
3. Event for Game Played: An event is emitted when a game is played, indicating the moves of both players and the result.
4. Play Move Function: Players can call this function to play a move (Rock, Paper, or Scissors).
5. Determine Winner Function: Players call this function to determine the winner based on the moves they played. The winner's balance is increased, and the loser's balance is decreased.
6. Get Balance Function: Players can check their current balance.
