module MarsRover
  class Rover
    attr_accessor :facing

    def north
      self.facing = MarsRover::Facing.new('N')
    end

    def west
      self.facing = MarsRover::Facing.new('W')
    end

    def east
      self.facing = MarsRover::Facing.new('E')
    end

    def south
      self.facing = MarsRover::Facing.new('S')
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
  end
end