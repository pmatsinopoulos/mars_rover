$: << "."
require 'initialize'

if ARGV[0].nil?
  puts "Give the input string as first argument"
  exit(1)
end
puts MarsRover::Simulator.new(:input_string => ARGV[0]).run