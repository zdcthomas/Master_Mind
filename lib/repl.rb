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
      start_game
    end
  end

  def self.game_start
    UserMessages.clear_screen
    puts UserMessages.home_screen
    user_input = Runner.ask
  end

end


def game_loop(mastermind,seed_string)
  guess = gets.chomp.downcase
  if guess.length > seed_string.length
    UserMessages.clear_screen
    puts "Answer exceeds guess length."
    game_loop
  elsif guess.length < seed_string.length
    UserMessages.clear_screen
    puts "Answer is less than guess length."
    game_loop
  elsif mastermind.check_correctness(guess) & mastermind.check_position(guess) == 4
    #winning or whatever
  else

  end

end

def guess_tracker

end

def difficulty_select
  UserMessages.difficulty_selection
  difficulty = gets.chomp.downcase

  if difficulty == "e"
    seed_string = "RGBY"
    UserMessages.beginner_game_screen
    mastermind = MasterMind.new(seed_string)
    game_loop(mastermind,seed_string)
    #do easy version
  elsif difficulty == "m"
    seed_string = "RGBYPP"
    UserMessages.intermediate_game_screen
    mastermind = MasterMind.new(seed_string)
    game_loop(mastermind,seed_string)
    #do medium version or wahtever
  elsif difficulty == "h"
    seed_string = "RGGBYPPO"
    UserMessages.hard_game_screen
    mastermind = MasterMind.new(seed_string)
    game_loop(mastermind,seed_string)
    #do hard stuff yo
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
