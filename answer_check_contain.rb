answer = ["r","b","g","y"]
guess = ["b","b","g","r"]

# answer.map do |letter|
#   guess.map do |guess_letter|
#     if letter == guess_letter
#       if answer.index(letter) == guess.index(guess_letter)
#         puts answer.index(letter)
#         puts guess.index
#         right_letters += 1
#         right_position += 1
#       else
#         right_letters += 1
#       end
#     end
#   end
# end
#
# puts "you got #{right_letters} letters correct, in #{right_position} correct positions."


# def content_check(guess,answer)
#   new_array =[]
#   temp_guess = guess.dup
#   temp_answer = answer.dup
#   temp_answer.map do |answer_letter|
#     temp_guess.find do |guess_letter|
#       if guess_letter == answer_letter
#         new_array << guess_letter
#         temp_answer[index(answer_letter)] = nil
#         temp_guess[index(guess_letter)] = nil
#       end
#     end
#   end
#   return new_array.length
# end
#
# puts content_check(guess,answer)
def letter_check(answer,guess)
  new_array =[]
  answer.each do |letter|
    new_array << guess.find {|guess_letter| guess_letter == letter}
  end
  new_array.compact.length
end

puts letter_check(answer,guess)
