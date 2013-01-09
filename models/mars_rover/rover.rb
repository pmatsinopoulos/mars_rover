module MarsRover
  class Rover
    attr_accessor :facing
    attr_reader   :plateau

    def north
      self.facing = MarsRover::Facing.new('N')
    end

    def north?
      self.facing.north?
    end

    def west
      self.facing = MarsRover::Facing.new('W')
    end

    def west?
      self.facing.west?
    end

    def east
      self.facing = MarsRover::Facing.new('E')
    end

    def east?
      self.facing.east?
    end

    def south
      self.facing = MarsRover::Facing.new('S')
    end

    def south?
      self.facing.south?
    end

    def left
      facing.left unless facing.nil?
    end

    def right
      facing.right unless facing.nil?
    end

    def facing
      @facing
    end

    def position
      @position
    end

    def land(plateau, x, y)
      raise Exception.new("Cannot land on this position. Out of Limits")    if plateau.out_of_limits?(x, y)
      raise Exception.new("cannot land on this position. Already occupied") if plateau.occupied?(x, y)

      @plateau = plateau

      plateau.occupy(x, y, self)

      @position = MarsRover::Position.new(x, y)
    end

    def move
      if north? && !plateau.out_of_limits?(position.x, position.y + 1) && !plateau.occupied?(position.x, position.y + 1)
        self.position.y += 1
      elsif west? && !plateau.out_of_limits?(position.x - 1, position.y) && !plateau.occupied?(position.x - 1, position.y)
        self.position.x -= 1
      elsif east? && !plateau.out_of_limits?(position.x + 1, position.y) && !plateau.occupied?(position.x + 1, position.y)
        self.position.x += 1
      elsif south? && !plateau.out_of_limits?(position.x, position.y - 1) && !plateau.occupied?(position.x, position.y - 1)
        self.position.y -= 1
      end
    end
  end
end