require "Minitest/autorun"
require "Minitest/pride"
require "./lib/master_mind"

class MasterMindTest < MiniTest::Test
  def setup
    @game = MasterMind.new
    @r = ["r","r","r","r"]
    @b = ["b","b","b","b"]
    @rb = ["r","b","r","b"]
    @rgby = ["r","g","b","y"]
    @string_input_rgby = "rbgy"

  end

  def test_number_of_correct_answers
    assert_equal 0 , @game.check_correctness(@r,@b)

    assert_equal 4 , @game.check_correctness(@r,@r)

    assert_equal 2 , @game.check_correctness(@rb , @r)
  end

  def test_number_of_correct_positions
    assert_equal 0 , @game.check_correctness(@r,@b)
    assert_equal 0 , @game.check_correctness(@r,@b)
    assert_equal 4 , @game.check_correctness(@r,@r)
    assert_equal 2 , @game.check_correctness(@rb , @r)
    assert_equal 2 , @game.check_correctness(@r , @rb)
    assert_equal 1 , @game.check_correctness(@r , @rgby)
  end

  # def test_answer_contains_input
  #   assert @game.answer_generation(@string_input_rgby).include?()
  #
  # end

  def test_generates_harder_answers
    skip
    #greater number of string elements
  end

end
