module MarsRover
  class Simulator
    def initialize(options)
      if options.has_key?(:input_string)
        initialize_from_string(options[:input_string])
      end
    end

    # Has to process the scene and return a string representing the output
    def run
      upper_x, upper_y = @lines[0].split(' ').map{|i| i.to_i}

      plateau = MarsRover::Plateau.new(upper_x, upper_y)

      result = ""
      (1..@lines.length - 1).step(2) do |index|
        i = index
        rover = nil
        unless @lines[i].nil?
          rover = MarsRover::Rover.new(:plateau => plateau, :input_string => @lines[i])
          i += 1
          unless @lines[i].nil?
            result = "#{result}\n" if result.length >= 1
            result = "#{result}#{rover.explore(@lines[i])}"
          end
        end
      end
      result
    end

    protected

    def initialize_from_string(input_string)
      message = <<-SQL
        Input string for initialization has to have at least 3 lines.
        First line is the upper_x and upper_y of the plateau.
        Subsequent pair of lines are: first line is landing position and facing of rover, whereas second line contains movements of rover
      SQL
      @lines = input_string.split(/\n/)
      raise Exception.new(message) unless @lines.length >= 3
    end
  end
end