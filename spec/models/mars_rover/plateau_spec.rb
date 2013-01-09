require 'spec_helper'

describe MarsRover::Plateau do
  it 'should be able to be constructed with upper x and y coordinates' do
    plateau = MarsRover::Plateau.new(10, 5)
    plateau.upper_x.should == 10
    plateau.upper_y.should == 5
  end

  context 'After constructed' do
    before do
      @plateau = MarsRover::Plateau.new(10,10)
    end

    it 'should not allow to change the dimensions of the plateau' do
      @plateau.should_not respond_to :upper_x=
      @plateau.should_not respond_to :upper_y=
    end

    context 'Landing' do

      it 'should allow a rover to land' do
        rover = MarsRover::Rover.new
        x = 5
        y = 5
        @plateau.land(x, y, rover)
        @plateau.occupied_by?(x, y, rover).should be_true
        @plateau.occupied?(x, y).should be_true
        rover_landed = @plateau.rover(x, y)
        rover_landed.should eq rover
      end

      it 'should not allow a rover to land on an occupied position' do
        rover = MarsRover::Rover.new
        x = 5
        y = 5
        @plateau.land(x, y, rover)
        @plateau.occupied_by?(x, y, rover).should be_true
        @plateau.occupied?(x, y).should be_true
        rover_landed = @plateau.rover(x, y)
        rover_landed.should eq rover

        # try to land on an occupied position
        new_rover = MarsRover::Rover.new
        lambda do
          @plateau.land(x, y, new_rover)
        end.should raise_error

        # still the old rover
        @plateau.rover(x, y).should eq rover
      end

      it 'should tell whether any of its positions is occupied or not' do
        plateau = MarsRover::Plateau.new(10, 5)
        plateau.should respond_to :occupied?
        # If I put a rover on a position it will tell me whether the position is occupied or not
        rover = MarsRover::Rover.new
        x = 3
        y = 2
        plateau.land(x, y, rover)
        plateau.occupied?(x, y).should be_true
        x = 3
        y = 1
        plateau.occupied?(x, y).should be_false
      end
    end
  end
end
