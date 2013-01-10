$: << File.join(File.dirname(__FILE__), "models", "mars_rover")
$: << File.join(File.dirname(__FILE__), "app", "mars_rover")

require 'position'
require 'facing'
require 'plateau'
require 'rover'
require 'simulator'