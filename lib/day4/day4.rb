class AoCSolverDay4
  def initialize(input)
    @cards = input.map { |card_line| Card.new card_line }
  end

  def part1
    @cards.map { |card| card.score }.sum
  end
end

class Card
  def initialize(input)
    fetch_values(input)
  end

  def fetch_values(input)
    actual_values, winning_values = input.split("|")
    _, actual_values = actual_values.split(":")
    @actual_values = actual_values.scan(/\d+/).map { |string| string.to_i }
    @winning_values = winning_values.scan(/\d+/).map { |value| value.to_i }
  end

  def score
    amount_of_winning_cards = @actual_values.count { |card_value| @winning_values.include? card_value }
    return amount_of_winning_cards if amount_of_winning_cards <= 1

    2**(amount_of_winning_cards - 1)
  end
end
