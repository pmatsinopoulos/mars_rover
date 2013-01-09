module MarsRover
  class Plateau
    attr_reader :upper_x
    attr_reader :upper_y
    attr_reader :plateau

    def initialize(upper_x, upper_y)
      @upper_x = upper_x
      @upper_y = upper_y

      @plateau = Array.new(upper_x) { |i| Array.new(upper_y)}
    end

    def land(x, y, rover)
      raise Exception.new("cannot land beyond #{upper_x} and below 0") unless 0 <= x && x <= upper_x
      raise Exception.new("cannot land beyond #{upper_y} and below 0") unless 0 <= y && y <= upper_y
      raise Exception.new("cannot land on this position. Already occupied") unless !occupied?(x, y)

      self.plateau[x][y] = rover
    end

    def occupied?(x, y)
      !@plateau[x][y].nil?
    end

    def occupied_by?(x, y, rover)
      occupied?(x, y) && @plateau[x][y].object_id == rover.object_id
    end

    def rover(x, y)
      @plateau[x][y]
    end
  end
end