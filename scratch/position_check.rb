answer = ["g","g","g","g"]
guess = ["b","g","b","g"]


# def position_check(guess,answer)
#   guess

def position_check(answer,guess)
  correct_positions = 0
  guess.each do |letter|
    puts "the answer index of #{letter} is #{answer.index(letter)}"
    puts "The guess index of #{letter} is #{guess.index(letter)}"
    puts "the number of correct positions is #{correct_positions}"
    puts ""
    answer.each do
      if answer.index(letter) == guess.index(letter)
        correct_positions += 1
    end
  end
  return correct_positions
end

puts position_check(answer,guess)


# def position_check(answer,guess)
#   correct_positions = 0
#   answer.each do |letter|
    # if
