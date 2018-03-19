module UserMessages

  def self.clear_screen
    puts "\e[H\e[2J"
  end

  def self.home_screen
    puts "Welcome to MASTERMIND"
    puts "\nWould you like to (p)lay\nread the (i)nstructions\nview the current (h)igh score holders\nor (q)uit?"
  end

  def self.beginner_game_screen
    puts "I have generated a beginner sequence with 4 colors and positions made up of:\n"
    puts "\n(r)ed \n(g)reen\n(b)lue\n(y)ellow\n\nUse (q)uit at any time to end the game."
    # puts "What's your guess?"
  end

  def self.intermediate_game_screen
    puts "I have generated an intermediate sequence with 5 colors and 6 positions made up of:"
    puts "\n(r)ed\n(g)reen\n(b)lue\n(y)ellow\n(p)urple\n\nUse (q)uit at any time to end the game."
    # puts "What's your guess?"
  end
  def self.hard_game_screen
    puts "I have generated a hard sequence with 6 colors and 8 positions made up of:"
    puts "\n(r)ed\n(g)reen\n(b)lue\n(y)ellow\n(p)urple\n(o)range\n\nUse (q)uit at any time to end the game."
    # puts "What's your guess?"
  end

  def self.win_message
    puts "CONGRATULATIONS!"
  end


  # expects user guess to be a string, and correct_elements, correct_positions, and number_of_guesses to be int
  def self.guess_response(user_guess, correct_elements, correct_positions, number_of_guesses)
    puts "#{user_guess} has #{correct_elements} of the correct elements\n with #{correct_positions} in the correct position"
    if number_of_guesses > 1
      print "You've taken #{number_of_guesses} guess."
    else
      print "You've taken #{numbers_of_guesses} guesses"
    end
  end

  def self.instructions
    puts "Welcome to MasterMind."
    puts "\nInstructions:\nBased on the selected difficulty, some number of colors will be chosen in a random order."
    puts "Your job is to guess the colors in the correct order by entering a series of the \nfirst letters of the names of those colors. e.g 'rgby'"
    puts "You have as many guesses as you like, but you will be timed.\n\nType 'main' at any time to return to the main menu."
    puts "\nGood Luck."
  end


  def self.difficulty_selection
    puts "What difficulty would you like to play?\n(e)asy\n(m)eadium\n(h)ard\n(c)ustom."
  end
end
# a = UserMessages. new
# a.clear_screen
# a.home_screen
# a.beginner_game_screen
# a.intermediate_game_screen
