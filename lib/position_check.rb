answer = ["g","g","g","g"]
guess = ["r","r","r","r"]


# def position_check(guess,answer)
#   guess

def position_check(answer,guess)
  correct_positions = 0
  answer_new = answer
  guess_new = guess
  answer.length.times do
    if answer_new.pop == guess_new.pop
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
