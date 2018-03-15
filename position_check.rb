answer = ["r","b","g","y"]
guess = ["b","r","y","g"]


# def position_check(guess,answer)
#   guess

def position_check(answer,guess)
  correct_positions = 0
  answer.each do |letter|
    if guess [answer.index(letter)] == letter
      correct_positions += 1
    end
  end
  return correct_positions
end

puts position_check(answer,guess)
