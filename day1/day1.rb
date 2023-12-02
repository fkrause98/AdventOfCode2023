# frozen_string_literal: true

class String
  def has_any_integer?
    chars.any? { |c| c.match?(/[0-9]/) } || any_literal_integer?
  end

  def any_literal_integer?
    literal_integers = %w[one two three four five six
                          seven eight nine ten]
    literal_integers.any? { |literal| match?(literal) }
  end
end

class AOCSolverDay1
  def initialize(input)
    integer_regex = [/one/i, /two/i, /three/i, /four/i, /five/i, /six/i, /seven/i, /eight/i, /nine/i, /[1-9]/]
    @number_matching_regex = /(?=(#{Regexp.union(integer_regex)}))/
    @literal_to_digit = {
      'one' => '1',
      'two' => '2',
      'three' => '3',
      'four' => '4',
      'five' => '5',
      'six' => '6',
      'seven' => '7',
      'eight' => '8',
      'nine' => '9'
    }
    @literal_to_digit.default_proc = proc { |h, k| h[k] = k }
    @input = input
  end

  def part1
    @input.sum { |line| line.has_any_integer? ? get_line_value_part_1(line) : 0 }
  end

  def part2
    @input
      .sum { |line| line.has_any_integer? ? get_line_value_part_2(line) : 0 }
  end

  def get_line_value_part_1(line)
    as_chars = line.chars
    first = as_chars.index { |c| c.match?(/[0-9]/) }
    second = as_chars.rindex { |c| c.match?(/[0-9]/) }
    Integer(as_chars[first] + as_chars[second])
  end

  def get_line_value_part_2(line)
    digits = line.scan(@number_matching_regex).flatten
    Integer(@literal_to_digit[digits.first] + @literal_to_digit[digits.last])
  end
end

require 'test/unit'

class TestAOCDay1Part1 < Test::Unit::TestCase
  def test01_first_line
    input = ['1abc2']
    solver = AOCSolverDay1.new input
    assert_equal(solver.part1, 12)
  end

  def test01_second_line
    input = ['pqr3stu8vwx']
    solver = AOCSolverDay1.new input
    assert_equal(solver.part1, 38)
  end

  def test_01_every_line
    input = %w[1abc2 pqr3stu8vwx a1b2c3d4e5f treb7uchet]
    solver = AOCSolverDay1.new input
    assert_equal(solver.part1, 142)
  end

  def test04_actual_input
    input = File.foreach('input.txt')
    solver = AOCSolverDay1.new input
    assert_equal(solver.part1, 53_974)
  end

  def test_example_part_2
    input = ['two1nine']
    solver = AOCSolverDay1.new input
    assert_equal(solver.part2, 29)
  end

  def test_example_part_3
    input = ['eighttwothree']
    solver = AOCSolverDay1.new input
    assert_equal(solver.part2, 83)
  end

  def test_example_part_4
    input = ['abcone2threexyz']
    solver = AOCSolverDay1.new input
    assert_equal(solver.part2, 13)
  end

  def test_example_part_5
    input = ['xtwoone3four']
    solver = AOCSolverDay1.new input
    assert_equal(solver.part2, 24)
  end

  def test_example_part_6
    input = ['4nineeightseven2']
    solver = AOCSolverDay1.new input
    assert_equal(solver.part2, 42)
  end

  def test_part_2_actual_input
    input = File.foreach('input.txt')
    solver = AOCSolverDay1.new input
    assert_equal(solver.part2, 52_840)
  end
end
