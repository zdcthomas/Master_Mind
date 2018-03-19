# Master_Mind
##### by Zachary Thomas
###### for Turing MasterMind project


This project is broken down into three directories and one file.  

### data:
Contains the csv file (which starts blank) of the contestants. This file stores the record of play of each contestant in the order of play, not the final leaderboard order. The final leaderboard order is created each time the display leaderboard function is called.

### lib:
Contains the core class, module, and method code, and is broken down into three subparts:
  * high_score: Contains the module HighScores which has methods for appending, reading, clearing, and calculating the top ten entries from the csv file stored in data/
  * master_mind: Contains the class MasterMind which is initialized whenever the player selects the difficult, and is passed a string of seed letters. Methods include checking the correctness of guess (position/content), keeping track of all the guesses of an instance of the game, and timing how long it takes to complete the game.
  * user_messages: Contains the module UserMessages, used exclusively for storing the text which the user will actually interact with.
### test:
Contains the testing for the file lib/master_mind.rb 
### mastermind: 
The main running file for the game. Contains the Runner module for very common tasks, and also conatains the main game loops, which call on lib/master_mind.rb /lib/user_messages.rb and /lib/high_score.rb. Mastermind has executable permission, and should run when called from anywhere. 

## How To Run:
From any directory, simply enter in the full path to the file “mastermind”
E.g turing/1module/master_mind_project/mastermind

#### Notes:
  * The leaderboard isn’t written to until the game is quit. I’m working on a solution.
  * There isn’t currently testing for the core REPL as I wasn’t sure how to full integrate user input into MiniTest
  * ASCII art will be added in a future update once I figure out how to consistently display it with ruby.


