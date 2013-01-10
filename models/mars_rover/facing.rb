module MarsRover
  class Facing
    attr_accessor :facing

    def initialize(facing)
      @facing = facing
    end

    def to_s
      facing
    end

    def north?
      @facing == 'N'
    end

    def west?
      @facing == 'W'
    end

    def east?
      @facing == 'E'
    end

    def south?
      @facing == 'S'
    end

    def left
      case @facing
        when 'N'
          self.facing = 'W'
        when 'W'
          self.facing = 'S'
        when 'S'
          self.facing = 'E'
        when 'E'
          self.facing = 'N'
        else
          raise Exception.new("invalid value for facing: #{@facing}")
      end
    end

    def right
      case @facing
        when 'N'
          self.facing = 'E'
        when 'E'
          self.facing = 'S'
        when 'S'
          self.facing = 'W'
        when 'W'
          self.facing = 'N'
        else
          raise Exception.new("invalid value for facing: #@facing")
      end
    end
  end
end