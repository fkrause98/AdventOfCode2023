require_relative 'day3'
require 'test/unit'
require 'set'
require 'matrix'
class TestAOCDay3Part1 < Test::Unit::TestCase
  def test01_parse_matrix
    input_string = "467..114..\n...*......\n..35..633.\n......#...\n617*......\n.....+.58.\n..592.....\n......755.\n...$.*....\n.664.598.."

    rows = input_string.split("\n")
    expected =
      [
        ['4', '6', '7', '.', '.', '1', '1', '4', '.', '.'],
        ['.', '.', '.', '*', '.', '.', '.', '.', '.', '.'],
        ['.', '.', '3', '5', '.', '.', '6', '3', '3', '.'],
        ['.', '.', '.', '.', '.', '.', '#', '.', '.', '.'],
        ['6', '1', '7', '*', '.', '.', '.', '.', '.', '.'],
        ['.', '.', '.', '.', '.', '+', '.', '5', '8', '.'],
        ['.', '.', '5', '9', '2', '.', '.', '.', '.', '.'],
        ['.', '.', '.', '.', '.', '.', '7', '5', '5', '.'],
        ['.', '.', '.', '$', '.', '*', '.', '.', '.', '.'],
        ['.', '6', '6', '4', '.', '5', '9', '8', '.', '.']
      ]

    schematic = EngineSchematic.new rows
    schematic.parse_input
    11.times { |i| assert_equal(schematic.input_matrix[i], expected[i]) }
  end

  def test02_parse_matrix_find_positions
    input_string = "467..114..\n...*......\n..35..633.\n......#...\n617*......\n.....+.58.\n..592.....\n......755.\n...$.*....\n.664.598.."

    # Split the input string into an array of rows
    rows = input_string.split("\n")
    expected =
      [
        [1, 3], [3, 6], [4, 3], [5, 5], [8, 3], [8, 5]
      ]
    schematic = EngineSchematic.new rows
    schematic.find_symbols_positions
    assert_equal(schematic.symbols_positions, expected)
  end

  def test03_parse_matrix_find_positions
    input_string = "467..114..\n...*......\n..35..633.\n......#...\n617*......\n.....+.58.\n..592.....\n......755.\n...$.*....\n.664.598.."
    rows = input_string.split("\n")
    expected =
      [[0, 2], [2, 2], [2, 3], [2, 6], [2, 7], [4, 2], [6, 4], [7, 6], [9, 2], [9, 3], [9, 5], [9, 6]]
    schematic = EngineSchematic.new rows
    assert_equal(schematic.find_every_adjacent_number.to_set, expected.to_set)
  end

  def test04_find_extreme
    input_string = "467..114..\n...*......\n..35..633.\n......#...\n617*......\n.....+.58.\n..592.....\n......755.\n...$.*....\n.664.598.."
    rows = input_string.split("\n")
    expected =
      [[9, 1], [9, 3]]
    schematic = EngineSchematic.new rows
    assert_equal(schematic.find_extremes([9, 3]), expected)
  end

  def test_05_find_every_digit
    input_string = "467..114..\n...*......\n..35..633.\n......#...\n617*......\n.....+.58.\n..592.....\n......755.\n...$.*....\n.664.598.."
    rows = input_string.split("\n")
    expected =
      [[[2, 2], [2, 3]],
       [[0, 0], [0, 2]],
       [[2, 6], [2, 8]],
       [[4, 0], [4, 2]],
       [[6, 2], [6, 4]],
       [[9, 1], [9, 3]],
       [[9, 5], [9, 7]],
       [[7, 6], [7, 8]]]
    schematic = EngineSchematic.new rows
    assert_equal(schematic.find_every_number_start_and_end, expected.to_set)
  end

  def test_06_should_return_467
    input_string = "467..114..\n...*......\n..35..633.\n......#...\n617*......\n.....+.58.\n..592.....\n......755.\n...$.*....\n.664.598.."
    rows = input_string.split("\n")
    positions = [[0, 0], [0, 2]]
    schematic = EngineSchematic.new rows
    assert_equal(schematic.get_number_at(positions), 467)
  end

  def test_solver_should_return_4361
    input_string = "467..114..\n...*......\n..35..633.\n......#...\n617*......\n.....+.58.\n..592.....\n......755.\n...$.*....\n.664.598.."
    rows = input_string.split("\n")
    solver = AoCSolverDay3.new(rows)
    assert_equal(solver.part1, 4361)
  end

  # def test_part2_should_return_467835
  #   input_string = "467..114..\n...*......\n..35..633.\n......#...\n617*......\n.....+.58.\n..592.....\n......755.\n...$.*....\n.664.598.."
  #   rows = input_string.split("\n")
  #   schematic = EngineSchematic.new rows
  #   assert_equal(schematic.find_every_gear_ratio_number, 467_835)
  # end

  # def test_part2_actual_input
  #   rows = File.foreach(File.dirname(__FILE__) + '/input.txt').to_a.map { |string| string.strip }
  #   assert_equal((AoCSolverDay3.new rows).part2, 84_159_075)
  # end
end
