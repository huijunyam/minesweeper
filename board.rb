require_relative 'tile'
require_relative 'game'

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(9) { Array.new(9) }

  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, mark)
    row, col = pos
    @grid[row][col] = mark
  end

  def populate_board
    bomb_positions = []
    10.times { bomb_positions << [rand(10), rand(10)] }
    @grid = @grid.map.with_index do |row, idx|
      row.map.with_index do |_, i|
        bomb_positions.include?([idx, i]) ? Tile.new(true) : Tile.new(false)
      end
    end
  end

  def display_grid
    print "  "
    puts (0..8).to_a.join(" ")
    @grid.each_with_index do |row, idx|
      print "#{idx} "
      puts row.map { |el| el.symbol }.join(' ')
    end
  end

  def reveal(pos)
    if grid[pos].is_bomb
      game.game_over
    else
      ####TODO
    end
  end
end
