
# This method takes a string of letters
# as an argument and returns a string of the same length,
# containing only those letters from the original string.

def StringGeneration (input_string = "ABCD")
  potential_letters = input_string.split("")
  puts potential_letters
  output_array = []
  potential_letters.each {output_array << potential_letters[rand(potential_letters.length)]}
  return output_array.to_s
end

puts StringGeneration("abcd")
