# The mastermind class is only passed a string input which determines dificulty
require 'pry'
class MasterMind

  attr_reader :answer

  def initialize(seed_letters)

    output_array = []
    seed_letters.each do
      output_array << seed_letters[rand(seed_letters.length)]
    end

    @answer = output_array
    @start_time = Time.now
    @previous_guesses = []
  end

  # Checks how many letters are correct in the guess
  # returns an integer
  def check_correctness(guess, answer = @answer)
    correct_letters = 0
    guess_new = guess.split("").dup
    answer.map do |answer_letter|
      if guess_new.include?(answer_letter)
        correct_letters += 1
        guess_new[guess_new.index(answer_letter)] = nil
      end
    end
    return correct_letters
  end


  def guess_tracker(guess)
    if guess == nil
      @previous_guesses
    else
      most_recent_guess = [guess, "#{check_correctness(guess)} elements", "#{check_position(guess)} positions"]
      @previous_guesses << most_recent_guess
    end
  end

  # Takes in a string and rearanges elements of the string
  # randomly, and outputs and array
  # difficulty = @difficulty
  # def answer_generation (difficulty)
    # potential_letters = input_string.split("")
    # output_array = []
    # potential_letters.each do
    #   output_array << potential_letters[rand(potential_letters.length)]
    # end
    # return output_array
  # end


  # Checks how many letters are in their correct positions
  # returns an integer
  def check_position(guess, answer = @answer)
    correct_positions = 0
    answer_new = answer.dup
    guess_new = guess.split("").dup
    answer.length.times do |num|
      if answer_new.pop == guess_new.pop
        correct_positions += 1
      end
    end
    return correct_positions
  end

  # Reports the elapsed time in hours minutes and seconds
  def end_timer_and_report_elapsed
    end_time = Time.now
    elapsed_time = end_time - @start_time
    hours_elapsed = elapsed_time / 3600
    minutes_elapsed = elapsed_time / 60
    seconds_elapsed = elapsed_time % 60
    if hours_elapsed.to_i < 1
       time_report = "#{minutes_elapsed.to_i} minutes, and #{seconds_elapsed.to_i} seconds"
    else
        time_report ="#{hours_elapsed.to_i} hours, #{minutes_elapsed.to_i} minutes, and #{seconds_elapsed.to_i} seconds"
    end
  end


end


# a = MasterMind.new
# sleep(96)
# puts a.end_timer_and_report_elapsed
