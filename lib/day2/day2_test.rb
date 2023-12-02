require_relative "day2.rb"
require "test/unit"

class TestAOCDay2Part1 < Test::Unit::TestCase
  def test01_first_line
    input = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"
    reds = 12
    greens = 13
    blues = 14
    game = Game.new(input, reds, greens, blues)
    assert(game.is_possible?)
  end

  def test02_second_line
    input = "Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue"
    reds = 12
    greens = 13
    blues = 14
    game = Game.new(input, reds, greens, blues)
    assert(game.is_possible?)
  end

  def test03_third_line
    input = "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red"
    reds = 12
    greens = 13
    blues = 14
    game = Game.new(input, reds, greens, blues)
    assert(not(game.is_possible?))
  end

  def test04_fourth_line
    input = "Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red"
    reds = 12
    greens = 13
    blues = 14
    game = Game.new(input, reds, greens, blues)
    assert(not(game.is_possible?))
  end

  def test05_fifth_line
    input = "Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"
    reds = 12
    greens = 13
    blues = 14
    game = Game.new(input, reds, greens, blues)
    assert(game.is_possible?)
  end

  def test06_full_example_line
    input = ["Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green",
             "Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue",
             "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red",
             "Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red",
             "Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"]
    reds = 12
    greens = 13
    blues = 14
    answer = AOCSolverDay2.new(reds, greens, blues, input).part1
    assert_equal(8, answer)
  end

  def test_random_from_input
    input = ["Game 10: 6 blue, 9 red, 3 green; 9 green, 7 blue, 9 red; 2 red, 4 blue, 6 green; 12 green, 7 blue, 5 red"]
    reds = 12
    greens = 13
    blues = 14
    answer = AOCSolverDay2.new(reds, greens, blues, input).part1
    assert_equal(10, answer)
  end

  def test_random_from_input_2
    input = ["Game 12: 18 green, 4 red, 12 blue; 7 green, 5 blue, 3 red; 7 green, 3 red; 8 green, 7 blue; 4 red, 7 green, 10 blue"]
    reds = 12
    greens = 13
    blues = 14
    answer = AOCSolverDay2.new(reds, greens, blues, input).part1
    assert_equal(0, answer)
  end

  def test_random_from_input_3
    input =
      ["Game 100: 16 red, 3 blue; 2 red, 5 green; 9 red; 1 blue, 3 green, 10 red; 1 red, 5 blue, 3 green; 12 blue, 9 red"]
    reds = 12
    greens = 13
    blues = 14
    answer = AOCSolverDay2.new(reds, greens, blues, input).part1
    assert_equal(0, answer)
  end

  def test_random_from_input_4
    input =
      ["Game 26: 1 green, 3 red, 2 blue; 7 red, 2 green, 11 blue; 7 blue, 4 red; 11 blue, 1 red, 1 green; 2 green, 10 blue, 1 red; 1 green, 7 red, 7 blue"]
    reds = 12
    greens = 13
    blues = 14
    answer = AOCSolverDay2.new(reds, greens, blues, input).part1
    assert_equal(26, answer)
  end

  def test07_example_from_input
    input = File.foreach("./lib/day2/input.txt")
    reds = 12
    greens = 13
    blues = 14
    answer = AOCSolverDay2.new(reds, greens, blues, input).part1
    assert_equal(2207, answer)
  end

  def test08_example_from_line_1
    input = File.foreach("./lib/day2/input.txt")
    reds = 12
    greens = 13
    blues = 14
    answer = AOCSolverDay2.new(reds, greens, blues, input).part1
    assert_equal(2207, answer)
  end

  def test09_part_2example_from_line_1
    input = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"
    reds = 12
    greens = 13
    blues = 14
    answer = Game.new(input, reds, greens, blues).minimum_power_set
    assert_equal(answer, 48)
  end

  def test10_part_2example_from_line_2
    input = "Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue"
    reds = 12
    greens = 13
    blues = 14
    answer = Game.new(input, reds, greens, blues).minimum_power_set
    assert_equal(answer, 12)
  end

  def test10_part_2example_from_line_3
    input = "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red"
    reds = 12
    greens = 13
    blues = 14
    answer = Game.new(input, reds, greens, blues).minimum_power_set
    assert_equal(answer, 1560)
  end

  def test11_part_2example_from_line_4
    input = "Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red"
    reds = 12
    greens = 13
    blues = 14
    answer = Game.new(input, reds, greens, blues).minimum_power_set
    assert_equal(answer, 630)
  end

  def test12_part_2example_from_line_5
    input = "Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"
    reds = 12
    greens = 13
    blues = 14
    answer = Game.new(input, reds, greens, blues).minimum_power_set
    assert_equal(answer, 36)
  end

  def test13_part_2_actual_inpunt
    input = File.foreach("./lib/day2/input.txt")
    reds = 12
    greens = 13
    blues = 14
    answer = AOCSolverDay2.new reds, greens, blues, input
    assert_equal(answer.part2, 62241)
  end
end
