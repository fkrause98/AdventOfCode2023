require 'test/unit'
require_relative './day4'
class TestAoCDay4Part1 < Test::Unit::TestCase
  # def test_cards_from_example
  #   card1_input =
  #     'Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53'
  #   card1 = Card.new card1_input
  #   assert_equal(card1.score, 8)
  # end

  # def test_cards_from_example_2
  #   card2_input =
  #     'Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19'
  #   card2 = Card.new card2_input
  #   assert_equal(card2.score, 2)
  # end

  # def test_cards_from_example_3
  #   card3_input =
  #     'Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1'
  #   card3 = Card.new card3_input
  #   assert_equal(card3.score, 2)
  # end

  # def test_cards_from_example_4
  #   card4_input =
  #     'Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83'
  #   card4 = Card.new card4_input
  #   assert_equal(card4.score, 1)
  # end

  # def test_cards_from_example_5
  #   card5_input =
  #     'Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36'
  #   card5 = Card.new card5_input
  #   assert_equal(card5.score, 0)
  # end

  # def test_cards_from_example_6
  #   input =
  #     "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
  #     Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
  #     Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
  #     Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
  #     Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
  #     Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11"
  #   input = input.split("\n")
  #   solver = AoCSolverDay4.new input
  #   assert_equal(solver.part1, 13)
  # end

  # def test_actual_input
  #   input = File.foreach(File.dirname(__FILE__) + '/input.txt').to_a.map { |string| string.strip }
  #   solver = AoCSolverDay4.new input
  #   assert_equal(solver.part1, 24_848)
  # end
  def test_part2_hash
    input =
      "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53
      Card 2: 13 32 20 16 61 | 61 30 68 82 17 32 24 19
      Card 3:  1 21 53 59 44 | 69 82 63 72 16 21 14  1
      Card 4: 41 92 73 84 69 | 59 84 76 51 58  5 54 83
      Card 5: 87 83 26 28 32 | 88 30 70 12 93 22 82 36
      Card 6: 31 18 13 56 72 | 74 77 10 23 35 67 36 11"
    input = input.split("\n")
    solver = AoCSolverDay4.new input
    solver.part2
  end
end
