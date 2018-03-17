answer = ["r","b","r","b"]≤
guess = ["r","r","r","r"]
require 'pry'


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
# def letter_check(answer,guess)
#
#   new_array =[]
#   guess_new = guess
#   answer_new = answer
#
#   guess_new.each do |guess_letter|
#      answer_new.each do |answer_letter|
#        puts answer_letter.class
#         if answer_letter == guess_letter
#           new_array << answer_letter
#           answer_new[answer_new.index(guess_letter)] = nil
#           puts guess_new.to_s
#         end
#     end
#   end
#   new_array.length
#   puts new_array.to_s
#   puts guess_new.to_s
# end
#
# puts letter_check(answer,guess)


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

puts check_correctness(guess,answer)
