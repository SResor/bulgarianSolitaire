# bulgarianSolitaire

Master File for the `bulgarianSolitaire` Assembly Language program. The game runs as follows:
1. The game starts with 45 cards, randomly divided into some number of piles of random size.
2. In each round, you take one card from each pile, forming a new pile with these cards.
3. The game is over when the player has piles of sizes 1, 2, 3, 4, 5, 6, 7, 8, and 9, in some order.

The program will produce a random starting configuration and then print it. It will then keep playing rounds while print the results of each round. When the final configuration described above is reached, it will stop and print the results.

`bulgarianSolitaire` Files:
- `main.s`: Initializes the array for storing the pile sizes and then calls several helper functions.
- `checkPiles.s`: Checks whether any piles are empty and adjusts array if so.
- `finalConfig.s`: Checks whether the final configuration of piles has been reached.
- `initGame.s`: Produces the random starting configuration for the game.
- `modulo.s`: Performs the modulo of two numbers passed to it.
- `playRound.s`: Runs one round of the Bulgarian Solitaire game.
- `printPiles.s`: Prints the size of each pile.

Successful output:

![Bulgarian Solitaire Output](https://user-images.githubusercontent.com/82683346/116360605-f4ec2280-a7b4-11eb-9163-93e920cfdd0f.png)

