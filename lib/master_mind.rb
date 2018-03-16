class MasterMind

  def initialize
    @guess
    @answer
  end
  # Checks how many letters are correct in the guess
  # returns an integer


  def check_correctness(guess,answer)
    correct_letters = 0
    guess_new = guess
    answer.map do |answer_letter|
      if guess_new.include?(answer_letter)
        correct_letters += 1
        guess_new[guess_new.index(answer_letter)] = nil
      end
    end
    return correct_letters
  end

  # Takes in a string and rearanges elements of the string
  # randomly, and outputs and array

  def string_generation (input_string = "RYGB")
    potential_letters = input_string.split("")
    output_array = []
    potential_letters.each do
      output_array << potential_letters[rand(potential_letters.length)]
    end
    return output_array
  end


  # Checks how many letters are in their correct positions
  # returns an integer

  def check_position(answer,guess)
    correct_positions = 0
    answer_new = answer
    guess_new = guess
    answer.length.times do |num|
      if answer_new.pop == guess_new.pop
        correct_positions += 1
      end
    end
    return correct_positions
  end

end
