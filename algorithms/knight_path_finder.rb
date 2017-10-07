class KnightPathFinder
  attr_reader :initialized_position
  attr_accessor :visited_positions

  def initialize(initialized_position)
    @initialized_position = initialized_position
    @visited_positions = [initialized_position]
  end

  def build_move_tree

  end

  def new_move_positions(pos)
    possible_positions = KnightPathFinder.valid_moves(pos)
    new_positions =
      possible_positions.select { |position| !@visited_positions.include?(position) }
    @visited_positions.concat(new_positions)
  end

  def self.valid_moves(pos)
    i = pos[0]
    j = pos[1]

    valid_moves = []
    (i-2..i+2).each do |x|
      next if (i - 2) < 0 || (i + 2) > 7
      next if i == x
      if (x - i).abs == 2
        valid_moves << [x, j - 1] << [x, j + 1]
      elsif (x - i).abs == 1
        valid_moves << [x, j - 2] << [x, j + 2]
      end
    end
    valid_moves
  end

  def find_path(end_pos)

  end

end
