# Solidity-Sample-Project-Codebases
I frequently push my recent sample smart contract for a better understanding of hunters!

WEB 3.0 GAME - ROCK PAPER SCISSORS DESCRIPTION:

1. Enum for Moves: We use an enumeration to represent the possible moves in the game (Rock, Paper, Scissors).
2. Mappings for Player Moves and Balances: The contract uses mappings to store the moves and balances of each player.
3. Event for Game Played: An event is emitted when a game is played, indicating the moves of both players and the result.
4. Play Move Function: Players can call this function to play a move (Rock, Paper, or Scissors).
5. Determine Winner Function: Players call this function to determine the winner based on the moves they played. The winner's balance is increased, and the loser's balance is decreased.
6. Get Balance Function: Players can check their current balance.

WEB 3.0 LOTTERY - DESCRIPTION:

1. Manager: The manager is the address that deploys the contract and has special privileges, such as picking a winner.
2. Participants Array: An array to store the addresses of participants who enter the lottery.
3. Events: Events are emitted to log important actions (participant entering, winner selected).
4. Restricted Modifier: A modifier to restrict certain functions to be called only by the manager.
5. Enter Function: Participants can call this function to enter the lottery by sending ether.
6. Pick Winner Function: The manager can call this function to randomly select a winner and transfer the entire contract balance to the winner.
7. Random Function: A simple pseudo-random number generator based on block information.
8. Get Balance Function: Participants or anyone can check the current balance of the lottery contract.
9. Get Participants Function: Participants or anyone can check the addresses of participants.

FEEL FREE TO CONTACT ME:

Email: umeryousuf26@gmail.com 
Twitter: https://twitter.com/top_djinn
Linkedin: https://www.linkedin.com/in/umer-yousuf/
