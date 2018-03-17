
# This method takes a string of letters
# as an argument and returns a string of the same length,
# containing only those letters from the original string.

def StringGeneration (input_string = "RYGB")
  potential_letters = input_string.split("")
  output_array = []
  potential_letters.each do
    output_array << potential_letters[rand(potential_letters.length)]
  end
  return output_array
end


puts StringGeneration()
