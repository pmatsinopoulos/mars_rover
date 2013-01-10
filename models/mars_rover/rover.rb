module MarsRover
  class Rover
    attr_accessor :facing
    attr_reader   :plateau

    def initialize(options)
      initialize_from_string(options) unless options.nil?
    end

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

    # @param facing {String} 'N', 'W', 'S', 'E'. The initial facing when landing on plateau
    #
    def land(plateau, x, y, facing = nil)
      raise Exception.new("Cannot land on this position. Out of Limits")    if plateau.out_of_limits?(x, y)
      raise Exception.new("cannot land on this position. Already occupied") if plateau.occupied?(x, y)

      self.facing = MarsRover::Facing.new(facing) unless facing.nil?

      @plateau = plateau

      plateau.occupy(x, y, self)

      @position = MarsRover::Position.new(x, y)
    end

    def move
      old_x = position.x
      old_y = position.y
      if north? && !plateau.out_of_limits?(position.x, position.y + 1) && !plateau.occupied?(position.x, position.y + 1)
        self.position.y += 1
      elsif west? && !plateau.out_of_limits?(position.x - 1, position.y) && !plateau.occupied?(position.x - 1, position.y)
        self.position.x -= 1
      elsif east? && !plateau.out_of_limits?(position.x + 1, position.y) && !plateau.occupied?(position.x + 1, position.y)
        self.position.x += 1
      elsif south? && !plateau.out_of_limits?(position.x, position.y - 1) && !plateau.occupied?(position.x, position.y - 1)
        self.position.y -= 1
      end
      if old_x != position.x || old_y != position.y
        plateau.occupy(position.x, position.y, self)
        plateau.release(old_x, old_y)
      end
    end

    def explore(input_string)
      input_string.split(//).each do |c|
        case c
          when 'L'
            left
          when 'R'
            right
          when 'M'
            move
          else
            raise Exception.new "Invalid action: #{c}"
        end
      end
      "#{position.x} #{position.y} #{facing}"
    end

    protected

    def initialize_from_string(options)
      x, y, facing = options[:input_string].split(' ')
      x = x.to_i
      y = y.to_i
      land(options[:plateau], x, y, facing)
    end

  end
end