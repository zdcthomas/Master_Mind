require 'csv'

module HighScores

  def self.add_name(name,guesses,time)
    high_scores = CSV.open("./data/high_scores.csv","a+")
    high_scores << [name,guesses,time]
  end

  def self.clear_file
    CSV.open('./data/high_scores.csv', 'w') {}
  end

  def self.high_score #returns a full leader_board array
    contenders = []
    CSV.foreach("./data/high_scores.csv","a+") do |name|
      contenders << name
    end
    # this one is a bit weird. The leader board goes from lowest to highest of everyone's
    # completeion time multiplied by their number of guess. This way-to-simple rubric allows
    # both speed and sccuracy to be judged. In a real game, I might decide to weight one value
    # over the other, but I'm too dumb for that. Also, because I'm working solely on the ruby array,
    # I can maintain the play order within the csv file. I might get rid of that though, mostly
    # because it's an extra step
    unless contenders == nil
      leader_board = contenders.sort! {|a,b| a[2].to_i * a[1].to_i <=> b[1].to_i * b[2].to_i}
    end

  end

  def self.display_top_ten
    top_ten = high_score[0...10]
    top_ten.each_with_index do |contestant,index|
      hours_elapsed = contestant[2].to_i / 3600
      minutes_elapsed = contestant[2].to_i / 60
      seconds_elapsed = contestant[2].to_i % 60
      # if hours_elapsed.to_i < 1
      puts "#{index + 1}.#{contestant[0]} #{contestant[1]} guesses, #{minutes_elapsed.to_i} minutes, and #{seconds_elapsed.to_i} seconds."
      # else
      #     puts "#{index + 1}. #{contestant[1[0]]} guesses in #{hours_elapsed.to_i} hours #{minutes_elapsed.to_i} minutes, and #{seconds_elapsed.to_i} seconds."
      # end
    end
  end

end
