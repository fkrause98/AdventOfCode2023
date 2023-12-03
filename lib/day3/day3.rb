require 'set'
require 'matrix'
class EngineSchematic
  attr_reader :input_matrix, :symbols_positions, :adjacent_numbers_positions

  def initialize(input)
    @input = input
    @input_matrix = parse_input
    @symbols_positions = []
    @gears_positions = []
  end

  def parse_input
    @input.map { |line| line.chars }
  end

  def find_symbols_positions
    @input_matrix
      .each_with_index do |row, i|
      row.each_with_index do |row_element, j|
        @symbols_positions << [i, j] if is_symbol(row_element)
      end
    end
    @symbols_positions
  end

  def find_every_adjacent_number
    find_symbols_positions
    @adjacent_numbers_positions = []
    @symbols_positions.each do |position|
      i = position.first
      j = position.last
      adjacent_numbers = adjacent_positions_with_numbers(i, j)
      @adjacent_numbers_positions.concat(adjacent_numbers)
    end
    @adjacent_numbers_positions
  end

  def find_gears
    @input_matrix
      .each_with_index do |row, i|
      row.each_with_index do |row_element, j|
        @gears_positions << [i, j] if is_symbol(row_element)
      end
    end
    @gears_positions
  end

  def is_symbol(row_element)
    !['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.'].include?(row_element)
  end

  def is_number(row_element)
    %w[0 1 2 3 4 5 6 7 8 9].include?(row_element)
  end

  def adjacent_positions_with_numbers(i, j)
    positions = []

    positions << [i, j - 1] if j - 1 >= 0

    positions << [i, j + 1] if j + 1 < @input_matrix[i].length

    positions << [i - 1, j] if i - 1 >= 0

    positions << [i + 1, j] if i + 1 < @input_matrix.length

    positions << [i - 1, j - 1] if i - 1 >= 0 && j - 1 >= 0

    positions << [i - 1, j + 1] if i - 1 >= 0 && j + 1 < @input_matrix[i].length

    positions << [i + 1, j - 1] if i + 1 < @input_matrix.length && j - 1 >= 0

    positions << [i + 1, j + 1] if i + 1 < @input_matrix.length && j + 1 < @input_matrix[i].length

    integer_positions = []
    positions.each do |position|
      i = position.first
      j = position.last
      element_at = @input_matrix[i][j]
      integer_positions << [i, j] if is_number(element_at)
    end
    integer_positions
  end

  def find_every_gear_ratio_number
    @input_matrix.each_with_index do |row, i|
      row.each_with_index do |row_element, j|
        @gears_positions << [i, j] if row_element == '*'
      end
    end
    asterisks_adjs = []
    @gears_positions.each do |position|
      asterisks_adjs << adjacent_positions_with_numbers_for_gear_position(position.first, position.last)
    end
    asterisks_adjs =
      asterisks_adjs.map do |positions|
        positions.map do |position|
          find_extremes position
        end
      end
    asterisks_adjs =
      asterisks_adjs.map do |row|
        row.to_set
      end
    asterisks_adjs =
      asterisks_adjs.select do |set|
        set.length == 2
      end
    asterisks_adjs =
      asterisks_adjs.map do |set|
        set.map do |number_index|
          get_number_at(number_index)
        end
      end
    asterisks_adjs =
      asterisks_adjs.map do |numbers|
        numbers.first * numbers.last
      end
    asterisks_adjs.sum
  end

  def adjacent_positions_with_numbers_for_gear_position(i, j)
    positions = []

    positions << [i, j - 1] if j - 1 >= 0

    positions << [i, j + 1] if j + 1 < @input_matrix[i].length

    positions << [i - 1, j] if i - 1 >= 0

    positions << [i + 1, j] if i + 1 < @input_matrix.length

    positions << [i - 1, j - 1] if i - 1 >= 0 && j - 1 >= 0

    positions << [i - 1, j + 1] if i - 1 >= 0 && j + 1 < @input_matrix[i].length

    positions << [i + 1, j - 1] if i + 1 < @input_matrix.length && j - 1 >= 0

    positions << [i + 1, j + 1] if i + 1 < @input_matrix.length && j + 1 < @input_matrix[i].length

    integer_positions = []
    positions.each do |position|
      i = position.first
      j = position.last
      element_at = @input_matrix[i][j]
      integer_positions << [i, j] if is_number(element_at)
    end
    integer_positions
  end

  def find_extremes(position)
    i = position.first
    j = position.last
    first_digit = j
    last_digit = j
    first_digit -= 1 while first_digit > 0 && is_number(@input_matrix[i][first_digit - 1])
    last_digit += 1 while last_digit + 1 < @input_matrix[i].length && is_number(@input_matrix[i][last_digit + 1])
    [[i, first_digit], [i, last_digit]]
  end

  def find_every_number_start_and_end
    find_every_adjacent_number
    @adjacent_numbers_positions.map { |position| find_extremes position }.to_set
  end

  def get_number_at(positions)
    row = positions.first.first
    raise 'Error' if row != positions.last.first

    column_start = positions.first.last
    column_ending = positions.last.last
    Integer(@input_matrix[row][column_start..column_ending].join(''))
  end
end

class AoCSolverDay3
  def initialize(input)
    @engine_schematic = EngineSchematic.new(input)
  end

  def part1
    positions = @engine_schematic.find_every_number_start_and_end

    positions
      .map { |position| @engine_schematic.get_number_at position }
      .sum
  end

  def part1
    positions = @engine_schematic.find_every_number_start_and_end

    positions
      .map { |position| @engine_schematic.get_number_at position }
      .sum
  end

  def part2
    @engine_schematic
      .find_every_gear_ratio_number
  end
end
input = File.foreach(File.dirname(__FILE__) + '/input.txt').to_a.map { |string| string.strip }
puts "Part 1 answer: #{(AoCSolverDay3.new input).part1}"
puts "Part 2 answer: #{(AoCSolverDay3.new input).part2}"
