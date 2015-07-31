class Knight
  attr_accessor :position, :position_history

  BOARD_SIZE   = 8
  KNIGHT_MOVES = [[1, 2], [1, -2], [2, 1], [2, -1],
                  [-1, 2], [-1, -2], [-2, 1], [-2, -1]]

  def initialize(position, position_history = [])
    @position         = position
    @position_history = position_history
  end

  def shortest_path(end_position)
    Knight.shortest_path(@position, end_position)
  end

  def self.shortest_path(start_position, end_position)
    unless Knight.valid_position?(start_position + end_position)
      return 'Invalid Position'
    end
    knight  = Knight.new(start_position, [start_position])
    knights = []
    until knight.position == end_position
      position         = knight.position
      position_history = knight.position_history
      KNIGHT_MOVES.each do |move|
        new_position = [position[0] + move[0], position[1] + move[1]]
        new_knight = Knight.new(new_position, position_history + [new_position])
        knights << new_knight if new_knight.valid_position?
        break if new_knight.position == end_position
      end
      knight = knights.shift
    end
    knight
  end

  def valid_position?
    Knight.valid_position?(@position)
  end

  def self.valid_position?(position)
    position.all? { |coordinate| coordinate <= BOARD_SIZE && coordinate >= 0 }
  end

  def to_s
    "Position:#{@position}\nPosition History: #{@position_history}"
  end
end

# script
puts "\n#{Knight.shortest_path([0, 0], [1, 2])}\n\n"
puts "#{Knight.shortest_path([0, 0], [3, 3])}\n\n"
puts "#{Knight.shortest_path([3, 4], [4, 3])}\n\n"
puts "#{Knight.shortest_path([3, 4], [4, 9])}\n\n" # => invalid

k = Knight.new([0, 0])
puts "#{k.shortest_path([1, 2])}\n\n"
puts "#{k.shortest_path([1, 7])}\n\n"
puts "#{k.shortest_path([1, -7])}\n\n" # => invalid
