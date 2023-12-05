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
    total = Hash[(@cards.map { |card| [card.id, 1] })]
    @cards.each do |card|
      matches = card.amount_of_winning_cards
      (card.id + 1..(card.id + matches)).each do |index|
        total[index] += total[card.id]
      end
    end
    total.sum { |card_id, copies| copies }
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
    base_score = amount_of_winning_cards
    return base_score if base_score <= 1

    2**(base_score - 1)
  end

  def amount_of_winning_cards
    @actual_values.count { |card_value| @winning_values.include? card_value }
  end
end
