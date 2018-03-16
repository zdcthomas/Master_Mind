require "Minitest/autorun"
require "Minitest/pride"
require "./lib/master_mind"

class MasterMindTest < MiniTest::Test
  def setup
    @game = MasterMind.new
    @r = ["r","r","r","r"]
    @b = ["b","b","b","b"]
    @rb = ["r","b","r","b"]

  end

  def test_number_of_correct_answers
    assert_equal 0 , @game.check_correctness(@r,@b)
    assert_equal 4 , @game.check_correctness(@r,@r)
    assert_equal 2 , MasterMind.new.check_correctness(@rb , @r)
  end

  def test_number_of_correct_positions
    skip
  end

  def test_random_answer_generation
    skip
  end

  def test_generates_harder_answers
    skip
    #greater number of string elements
  end

end
