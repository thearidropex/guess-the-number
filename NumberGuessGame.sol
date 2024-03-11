// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.19;

contract NumberGuessGame {
    address public player;
    bool public gameEnded;
    uint public result;
    uint public randomNumber;

    constructor() {
        player = msg.sender;
        gameEnded = false;
    }

    function guessNumberAndGenerateRandom(uint playerGuess) public {
        require(msg.sender == player, "Only the player can guess and generate a random number");
        require(playerGuess <= 10, "Guess should be between 0 and 10");

        randomNumber = uint(keccak256(abi.encodePacked(block.timestamp, blockhash(block.number - 1)))) % 11;

        result = absoluteDifference(randomNumber, playerGuess);
        gameEnded = true;
    }

    function absoluteDifference(uint a, uint b) private pure returns (uint) {
        return a > b ? a - b : b - a;
    }
}
