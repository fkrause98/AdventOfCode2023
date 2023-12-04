class AoCSolverDay4
  def initialize(input)
    @cards = input.map { |card_line| Card.new card_line }
  end

  def part1
    @cards
      .map { |card| card.score }
      .sum
  end

  def part2
    @cards
      .map { |card| [card.id, card] }
      .to_h
  end
end

class Card
  attr_reader :id

  def initialize(input)
    fetch_values(input)
  end

  def fetch_values(input)
    actual_values, winning_values = input.split('|')
    game_identifier, actual_values = actual_values.split(':')
    @id = game_identifier.scan(/\d+/).first.to_i
    @actual_values = actual_values.scan(/\d+/).map { |string| string.to_i }
    @winning_values = winning_values.scan(/\d+/).map { |value| value.to_i }
  end

  def score
    amount_of_winning_cards = @actual_values.count { |card_value| @winning_values.include? card_value }
    return amount_of_winning_cards if amount_of_winning_cards <= 1

    2**(amount_of_winning_cards - 1)
  end

  def matching_cards
    @actual_values.count { |card_value| @winning_values.include? card_value }
  end
end
