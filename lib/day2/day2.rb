class AOCSolverDay2
  def initialize(red_cubes, green_cubes, blue_cubes, games)
    @red_cubes = red_cubes
    @green_cubes = green_cubes
    @blue_cubes = blue_cubes
    @games = games
  end

  def part1
    @games
      .map { |a_game_input| Game.new(a_game_input, @red_cubes, @green_cubes, @blue_cubes) }
      .select { |elf_game| elf_game.is_possible? }
      .map { |elf_game| elf_game.id }
      .sum
  end

  def part2
    @games
      .map { |a_game_input| Game.new(a_game_input, @red_cubes, @green_cubes, @blue_cubes) }
      .map { |a_game| a_game.minimum_power_set }
      .sum
  end
end

class Game
  def initialize(input_string, red_cubes, green_cubes, blue_cubes)
    identifier, game_order = input_string.strip.split(':')
    @game_id = identifier.split('Game').last.to_i
    @game_order = game_order.split(';').map { |c| c.delete(' ').split(',') }
    @red_cubes = red_cubes
    @green_cubes = green_cubes
    @blue_cubes = blue_cubes
  end

  def parse_single_game(game_array)
    dict = { red: 0, blue: 0, green: 0 }
    game_array.each do |string|
      num_positions_positions = string.scan(/\d+/).first
      dict[string.delete(num_positions).to_sym] = num_positions.to_i
    end
    dict
  end

  def is_possible?
    @game_order.inject(true) do |possible, a_game|
      game_dict = parse_single_game(a_game)
      game_dict[:red] <= @red_cubes &&
        game_dict[:blue] <= @blue_cubes &&
        game_dict[:green] <= @green_cubes &&
        possible
    end
  end

  def minimum_config
    min_red = 0
    min_blue = 0
    min_green = 0
    @game_order.each do |a_game|
      game_dict = parse_single_game(a_game)
      min_red = [game_dict[:red], min_red].max
      min_blue = [game_dict[:blue], min_blue].max
      min_green = [game_dict[:green], min_green].max
    end
    [min_red, min_blue, min_green]
  end

  def minimum_power_set
    min_red, min_blue, min_green = minimum_config
    min_red * min_blue * min_green
  end

  def id
    @game_id
  end
end

input = File.foreach('./lib/day2/input.txt')
puts "Solution for part 1: #{AOCSolverDay2.new(12, 13, 14, input).part1}"

input = File.foreach('./lib/day2/input.txt')
puts "Solution for part 2: #{AOCSolverDay2.new(12, 13, 14, input).part2}"
