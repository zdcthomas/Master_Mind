require "Minitest/autorun"
require "Minitest/pride"
require "./lib/master_mind"


class MasterMindTest < MiniTest::Test
  def setup
    @game4 = MasterMind.new(["r","g","b","y"])
    @game5 = MasterMind.new(["r","g","b","y","c"])
    @game6 = MasterMind.new(["r","g","b","y","c","p"])
    @answer = @game4.answer.map {|letter| letter }
    @r = ["r","r","r","r"]
    @rstring = "rrrr"
    @b = ["b","b","b","b"]
    @bstring = "bbbb"
    @rb = ["r","b","r","b"]
    @rbstring = "rbrb"
    @rgby = ["r","g","b","y"]
    @rgbystring = "rgby"

  end

  def test_number_of_correct_answers
    assert_equal 4 , @game4.check_correctness(@rstring , @r)
    assert_equal
  end

  def test_number_of_correct_positions

    assert_equal 0 , @game4.check_position(@rstring,@b)
    assert_equal 4 , @game4.check_position(@rstring,@r)
    assert_equal 2 , @game4.check_position(@rbstring , @r)
    assert_equal 2 , @game4.check_position(@rstring , @rb)
    assert_equal 1 , @game4.check_position(@rstring , @rgby)
  end


  def test_generates_right_length_answers
    assert_equal 4 , @game4.answer.length
    assert_equal 5 , @game5.answer.length
    assert_equal 6 , @game6.answer.length

  end

  def test_timer
    sleep(3)
    assert_equal 3 , @game4.end_timer_and_report_elapsed("s").to_i
    sleep(3)
    assert_equal 6 , @game5.end_timer_and_report_elapsed("s").to_i
    assert_equal 6 , @game6.end_timer_and_report_elapsed("s").to_i
  end

end
