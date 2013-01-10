# Mars Rover Application

## Short Description

Print the position that the robot will have at the end of the instructions that it has taken from NASA.

## Long Description

A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This plateau, which is curiously rectangular, must be navigated by the rovers so that their on-board
cameras can get a complete view of the surrounding terrain to send back to Earth.

A rover's position and location is represented by a combination of x and y co-ordinates and a letter representing one of the four cardinal compass points. The plateau is divided
up into a grid to simplify navigation. An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North.

In order to control a rover, NASA sends a simple string of letters. The possible letters are 'L', 'R' and 'M'. 'L' and 'R' makes the rover spin 90 degrees left or right
respectively, without moving from its current spot. 'M' means move forward one grid point, and maintain the same heading.

Assume that the square directly North from (x, y) is (x, y+1).

INPUT:

The first line of input is the upper-right coordinates of the plateau, the lower-left coordinates are assumed to be 0,0.

The rest of the input is information pertaining to the rovers that have been deployed. Each rover has two lines of input. The first line gives the rover's position, and the second line is a series of instructions telling the rover how to explore the plateau.

The position is made up of two integers and a letter separated by spaces, corresponding to the x and y co-ordinates and the rover's orientation.

Each rover will be finished sequentially, which means that the second rover won't start to move until the first one has finished moving.

OUTPUT

The output for each rover should be its final co-ordinates and heading.

INPUT AND OUTPUT

Test Input:
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM

Expected Output:
1 3 N
5 1 E

## Implementation

Implementation language is Ruby.

## Testing

### Preparing for Testing

When you clone the project (you need git for that), or when you just download and unzip on any of your folders, you will need to have bundler installed

<code>
gem install bundler --no-ri --no-rdoc
</code>

in case you do not have it.

Having the bundler installed, you need to run

<code>
bundle
</code>

This is necessary only if you want to run the specs. Otherwise, just use `ruby` (see later on on Running the program from command line).

### Running the tests

You can run the tests and watch them green.

<code>
rake
</code>

You should see something like this:

<pre>
Feature:
  As a Mars Rover User,
  I want to be able to land Rovers
  And move them around on plateau

  Scenario: Normal landing and movement, without collisions # features/mars_rover.feature:6
    Given test input                                        # features/step_definitions/mars_rover_steps.rb:1
      | 5 5        |
      | 1 2 N      |
      | LMLMLMLMM  |
      | 3 3 E      |
      | MMRMMRMRRM |
    Then output should be                                   # features/step_definitions/mars_rover_steps.rb:9
      | 1 3 N |
      | 5 1 E |

  Scenario: One rover will not move onto another # features/mars_rover.feature:17
    Given test input                             # features/step_definitions/mars_rover_steps.rb:1
      | 5 5       |
      | 1 2 N     |
      | LMLMLMLMM |
      | 3 2 N     |
      | MLMM      |
    Then output should be                        # features/step_definitions/mars_rover_steps.rb:9
      | 1 3 N |
      | 2 3 W |

  Scenario: One rover cannot land onto another                                               # features/mars_rover.feature:28
    Given test input                                                                         # features/step_definitions/mars_rover_steps.rb:1
      | 5 5       |
      | 1 2 N     |
      | LMLMLMLMM |
      | 1 3 N     |
      | MLMM      |
    Then it should raise error with message "cannot land on this position. Already occupied" # features/step_definitions/mars_rover_steps.rb:16

  Scenario: Should not move passed the left wall of the plateau # features/mars_rover.feature:37
    Given test input                                            # features/step_definitions/mars_rover_steps.rb:1
      | 5 5       |
      | 1 2 N     |
      | LMMMMMMMM |
      | 3 2 S     |
      | MLMM      |
    Then output should be                                       # features/step_definitions/mars_rover_steps.rb:9
      | 0 2 W |
      | 5 1 E |

  Scenario: Should not move passed the top wall of the plateau # features/mars_rover.feature:48
    Given test input                                           # features/step_definitions/mars_rover_steps.rb:1
      | 5 5          |
      | 1 2 N        |
      | MMMMMMMMMMMM |
      | 3 2 S        |
      | MLMM         |
    Then output should be                                      # features/step_definitions/mars_rover_steps.rb:9
      | 1 5 N |
      | 5 1 E |

  Scenario: Should not move passed the right wall of the plateau # features/mars_rover.feature:59
    Given test input                                             # features/step_definitions/mars_rover_steps.rb:1
      | 5 5          |
      | 1 2 N        |
      | MMMMMMMMMMMM |
      | 2 3 S        |
      | MLMMMMMMMMMM |
    Then output should be                                        # features/step_definitions/mars_rover_steps.rb:9
      | 1 5 N |
      | 5 2 E |

6 scenarios (6 passed)
12 steps (12 passed)
0m0.026s
/home/panayotis/.rvm/rubies/ruby-1.9.3-p125/bin/ruby -S rspec ./spec/models/mars_rover/plateau_spec.rb ./spec/models/mars_rover/rover_spec.rb
.........................

Finished in 0.00806 seconds
25 examples, 0 failures

</pre>

### Acceptance Tests

As you can see, I am using [Cucumber](https://github.com/cucumber/cucumber) for acceptance testing. Actually, I have used in in BDD mode. Initially, I have written the majority of the features and specs and then I tried
to turn them green.

If you want to write more test scenarios, it is very easy. Just change the file <code>features/mars_rover.feature</code> accordingly. I.e. add somethin like a new Scenario and watch
it become green with running:

<code>
rake cucumber
</code>

### Unit Tests

I used [RSpec](https://github.com/rspec/rspec-core) for that. Again in BDD mode, I have written the majority of the specs and then I tried to make them green.

## Running from command line

You need to call `ruby main.rb` and give the input as a multiline string. Example:
<code>
ruby main.rb "5 5
> 1 2 N
> LMLMLMLMM
> 3 3 E
> MMRMMRMRRM"
<code>

It will print the result.

## Questions?

Send them to [panayotis@matsinopoulos.gr](mailto:panayotis@matsinopoulos.gr).
