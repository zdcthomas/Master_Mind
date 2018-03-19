require 'csv'
csv = CSV.open("../data/data_test.csv","a+")

user_input = 0
while user_input != "q"
  user_input = gets.chomp
  csv << [user_input]
end

x = CSV.read("../data/data_test.csv")
puts x

# x.each do |array|
#   puts array
# end

def clear_file
  CSV.open("../data/data_test.csv","w") {|row| row.truncate(0) }
end

clear_file
puts "csv file after clear:"
x.each do |array|

  puts array
end

def high_score
  contenders = []
  CSV.foreach("../data/data_test.csv","a+") do |name|
    contenders << name
  end
  contenders.sort {|a,b| (b[1]*b[2] <=> a[1]*a[2])}
