require 'pry'
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
  # puts mastermind.guess_tracker(nil)
  # # binding.pry
  # puts "_" * mastermind.guess_tracker(nil).length
  puts "What is your guess?"
  print ">>"
  guess = gets.chomp.downcase

  #cheat message
  if guess == "c"
    puts "the answer is #{mastermind.answer}"
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
    UserMessages.win_message
    puts "You completed that challenge in #{mastermind.end_timer_and_report_elapsed}"
    puts "Well done!!"
    puts "Would you like to\n(p)lay again\ngo to the (m)ain menu\nor (q)uit?"
    after_win_input = Runner.ask
    if after_win_input.downcase == "q"
      Runner.quit
    elsif after_win_input.downcase == "m"
      main_loop
    elsif after_win_input.downcase == "p"
      difficulty_select
    end
  else
    puts "You guessed #{guess}\nwhich has #{mastermind.check_correctness(guess)} correct colors"
    puts "in #{mastermind.check_position(guess)} correct positions."
    puts "\n"
    game_loop(mastermind,seed_array)

    #not winning
    #reports content and position.
    #adds guess to previous guesses
  end

end




def difficulty_select
  UserMessages.difficulty_selection
  difficulty = gets.chomp.downcase

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
    #do that custom job, what what
  elsif difficulty == "main"
    main_loop
  else
    UserMessages.clear_screen
    puts "Invalid input. \nPress enter to return to difficulty selection."
    gets
    difficulty_select
  end

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
