require 'pry'
require 'csv'

require './master_mind'
# check_correctness
# check_position
# answer_generation (runs once on initialization of each new instance)
# end_timer_and_report_elapsed
require './user_messages'
# clear_screen
# home_screen
# beginner_game_screen
# guess_response
require './high_score'

module Runner

  def self.ask
    print ">>"
    user_input = gets.chomp
  end

  def self.tell(message)
    print message
  end


  def self.quit
    puts "are you sure you want to quit?"
    print "(y)es, (n)o >>"
    quit_yes_no = gets.chomp
    if quit_yes_no.strip == "y"
      UserMessages.clear_screen
      abort ("Goodbye.")
    elsif quit_yes_no.strip == "n"
      main_loop
    end
  end

  def self.game_start
    UserMessages.clear_screen
    puts UserMessages.home_screen
    user_input = Runner.ask
  end

end


def game_loop(mastermind,seed_array)
  UserMessages.clear_screen
  guess = nil
  mastermind.previous_guesses.each do |guess|
    puts guess
    puts "\n"
  end
  puts "What is your guess?"
  guess = Runner.ask
  if guess == "h"
    UserMessages.clear_screen
    mastermind.previous_guesses.each do |guess|
      puts guess
      puts "\n"
    end
    game_loop(mastermind,seed_array)
  else
    #cheat message
    if guess == "c"
      UserMessages.clear_screen
      puts "the answer is #{mastermind.answer}"
      puts "3"
      sleep(1)
      puts "2"
      sleep (1)
      puts "1"
      sleep (1)
      game_loop(mastermind,seed_array)

    elsif guess == "q"
      Runner.quit

      #too long
    elsif guess.length > seed_array.length
      UserMessages.clear_screen
      puts "Answer exceeds guess length."
      game_loop(mastermind,seed_array)

      #too short
    elsif guess.length < seed_array.length
      UserMessages.clear_screen
      puts "Answer is less than guess length."
      game_loop(mastermind,seed_array)

      #correct answer
    elsif mastermind.check_correctness(guess) & mastermind.check_position(guess) == seed_array.length
      victory(mastermind,guess)
      # UserMessages.win_message
      # puts "You completed that challenge in #{mastermind.end_timer_and_report_elapsed}"
      # puts "Well done!!"
      # puts "Would you like to\n(p)lay again\ngo to the (m)ain menu\nor (q)uit?"
      # after_win_input = Runner.ask
      # if after_win_input.downcase == "q"
      #   Runner.quit
      # elsif after_win_input.downcase == "m"
      #   main_loop
      # elsif after_win_input.downcase == "p"
      #   difficulty_select
      # end
    else
      # puts "You guessed #{guess}\nwhich has #{mastermind.check_correctness(guess)} correct colors"
      # puts "in #{mastermind.check_position(guess)} correct positions."
      # puts "\n"
      mastermind.guess_tracker(guess)
      game_loop(mastermind,seed_array)

      #not winning
      #reports content and position.
      #adds guess to previous guesses
    end
  end



end

def victory(mastermind,guess)
  UserMessages.win_message
  puts "You guessed the correct answer: #{guess} in #{mastermind.end_timer_and_report_elapsed}"
  puts "Well done!!"
  puts "Would you like to submit your name to the leader board?"
  puts "(y)es or (n)o"
  submit_yes_no = Runner.ask
  if submit_yes_no == "y"
    add_to_high_score(mastermind)
  else
    play_again
  end
end

def play_again
  puts "Would you like to\n(p)lay again\ngo to the (m)ain menu\nor (q)uit?"
  after_win_input = Runner.ask
  if after_win_input.downcase == "q"
    Runner.quit
  elsif after_win_input.downcase == "m"
    main_loop
  elsif after_win_input.downcase == "p"
    difficulty_select
  end
end

def difficulty_select
  UserMessages.clear_screen
  UserMessages.difficulty_selection
  difficulty = Runner.ask

  if difficulty == "e"
    seed_array = ["r","g","b","y"]
    UserMessages.clear_screen
    UserMessages.beginner_game_screen
    mastermind = MasterMind.new(seed_array)
    game_loop(mastermind,seed_array)
    #do easy version
  elsif difficulty == "m"
    seed_array = ["r","g","b","y","p","p"]
    UserMessages.clear_screen
    UserMessages.intermediate_game_screen
    mastermind = MasterMind.new(seed_array)
    game_loop(mastermind,seed_array)
    #do medium version or wahtever
  elsif difficulty == "h"
    seed_array = ["r","g","g","b","y","p","p","o"]
    UserMessages.clear_screen
    UserMessages.hard_game_screen
    mastermind = MasterMind.new(seed_array)
    game_loop(mastermind,seed_array)

  elsif difficulty == "c"
    custom_difficulty
  elsif difficulty == "q" || difficulty == "main"
    main_loop
  else
    UserMessages.clear_screen
    puts "Invalid input. \nPress enter to return to difficulty selection."
    gets
    difficulty_select
  end

end

def custom_difficulty
  user_colors = []
  loop do
    UserMessages.clear_screen
    puts "Please enter the colors you would like to be included."
    puts "The number of colors you enter will also be the number of positions in the sequence."
    puts "You can also (s)top adding colors or reuturn to the (m)ain menu.\n"
    puts user_colors
    next_color = Runner.ask
    if next_color == "s" && user_colors == []
      puts "You have not enetered a color."
      puts " Would you like to enter more (c)olors or would you like to choose a (s)tandard difficulty?"
      stay_or_go = Runner.ask
      if stay_or_go == "c"
        custom_difficulty
      elsif stay_or_go == "s"
        difficulty_select
      end
    elsif next_color == "s"
      puts "Is #{user_colors} all the you would like to use?"
      puts "(y)es (n)o"
      done_yes_no = Runner.ask
      if done_yes_no == "n"
      elsif done_yes_no == "y"
        first_letters = user_colors.map {|color| color[0]}
        mastermind = MasterMind.new(first_letters)
        game_loop(mastermind,first_letters)
      end
    elsif next_color == "m"
      main_loop
    else
      user_colors << next_color
    end
  end
end

def add_to_high_score(mastermind)
  puts "Enter your name below."
  name = Runner.ask
  # binding.pry
  HighScores.add_name(name,(mastermind.previous_guesses.length + 1), mastermind.end_timer_and_report_elapsed("s"))
  HighScores.display_top_ten
  play_again
end

def main_loop
  user_input = Runner.game_start

  if user_input == "i"
    UserMessages.clear_screen
    UserMessages.instructions
    puts "\nPress enter to exit."
    gets
    main_loop
  elsif user_input == "p"
    difficulty_select
  elsif user_input == "h"
    HighScores.display_top_ten
    puts "Press enter to return to the main menu."
    gets
    main_loop
  elsif user_input == "q"
    Runner.quit
  else
    UserMessages.clear_screen
    puts "Invalid input. \nPress enter to return to main menu."
    gets
    main_loop
  end
end

main_loop
