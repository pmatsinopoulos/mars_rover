module MarsRover
  class Plateau
    attr_reader :upper_x
    attr_reader :upper_y
    attr_reader :plateau

    def initialize(upper_x, upper_y)
      raise Exception.new("limits are invalid") unless MarsRover::Plateau.valid_limits?(upper_x, upper_y)

      @upper_x = upper_x
      @upper_y = upper_y

      @plateau = Array.new(upper_x + 1) { |i| Array.new(upper_y + 1)}
    end

    def self.valid_limits?(x, y)
      x >=0 && y >= 0
    end

    def occupy(x, y, rover)
      self.plateau[x][y] = rover
    end

    def occupied?(x, y)
      !@plateau[x].nil? && !@plateau[x][y].nil?
    end

    def occupied_by?(x, y, rover)
      occupied?(x, y) && @plateau[x][y].object_id == rover.object_id
    end

    def out_of_limits?(x, y)
      x < 0 || x > upper_x || y < 0 || y > upper_y
    end

    def rover(x, y)
      @plateau[x][y]
    end
  end
end