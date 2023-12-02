require_relative "./day1.rb"
require "test/unit"

class TestAOCDay1Part1 < Test::Unit::TestCase
  def test01_first_line
    input = ["1abc2"]
    solver = AOCSolverDay1.new input
    assert_equal(solver.part1, 12)
  end

  def test01_second_line
    input = ["pqr3stu8vwx"]
    solver = AOCSolverDay1.new input
    assert_equal(solver.part1, 38)
  end

  def test_01_every_line
    input = %w[1abc2 pqr3stu8vwx a1b2c3d4e5f treb7uchet]
    solver = AOCSolverDay1.new input
    assert_equal(solver.part1, 142)
  end

  def test04_actual_input
    input = File.foreach("./lib/day1/input.txt")
    solver = AOCSolverDay1.new input
    assert_equal(solver.part1, 53_974)
  end

  def test_example_part_2
    input = ["two1nine"]
    solver = AOCSolverDay1.new input
    assert_equal(solver.part2, 29)
  end

  def test_example_part_3
    input = ["eighttwothree"]
    solver = AOCSolverDay1.new input
    assert_equal(solver.part2, 83)
  end

  def test_example_part_4
    input = ["abcone2threexyz"]
    solver = AOCSolverDay1.new input
    assert_equal(solver.part2, 13)
  end

  def test_example_part_5
    input = ["xtwoone3four"]
    solver = AOCSolverDay1.new input
    assert_equal(solver.part2, 24)
  end

  def test_example_part_6
    input = ["4nineeightseven2"]
    solver = AOCSolverDay1.new input
    assert_equal(solver.part2, 42)
  end

  def test_part_2_actual_input
    input = File.foreach("./lib/day1/input.txt")
    solver = AOCSolverDay1.new input
    assert_equal(solver.part2, 52_840)
  end
end
