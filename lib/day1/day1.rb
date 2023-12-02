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
      "one" => "1",
      "two" => "2",
      "three" => "3",
      "four" => "4",
      "five" => "5",
      "six" => "6",
      "seven" => "7",
      "eight" => "8",
      "nine" => "9",
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

input = File.foreach("./lib/day1/input.txt")
puts "Solution for part 1: #{AOCSolverDay1.new(input).part1}"

input = File.foreach("./lib/day1/input.txt")
puts "Solution for part 2: #{AOCSolverDay1.new(input).part2}"
