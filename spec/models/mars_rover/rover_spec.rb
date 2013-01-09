require 'spec_helper'

describe MarsRover::Rover do
  before do
    @rover = MarsRover::Rover.new
    x = 5
    y = 10
    @plateau = MarsRover::Plateau.new(20, 15)
    @rover.land(@plateau, x, y)
  end

  context 'When facing north' do
    before do
      @rover.north
      @rover.facing.should be_north
    end

    context 'Turning' do
      it 'should be facing west if instructed to left' do
        @rover.left
        @rover.facing.should be_west
      end

      it 'should be facing east if instructed to right' do
        @rover.right
        @rover.facing.should be_east
      end
    end

    context 'Moving forward' do
      it 'should move north one step when there is space to go' do
        # setup
        old_x = @rover.position.x
        old_y = @rover.position.y
        old_y.should < @rover.plateau.upper_y
        old_y.should >= 0

        # try to move
        @rover.move

        # check
        @rover.position.x.should == old_x
        @rover.position.y.should == old_y + 1
        @rover.facing.should be_north
      end

      it 'should not move north when there is space but occupied' do
        # setup
        old_x = @rover.position.x
        old_y = @rover.position.y
        old_y.should < @rover.plateau.upper_y
        old_y.should >= 0
        other_rover = MarsRover::Rover.new
        other_rover.land(@rover.plateau, old_x, old_y + 1)
        @rover.plateau.occupied?(old_x, old_y + 1).should be_true

        # try to move
        @rover.move

        # check
        @rover.position.x.should == old_x
        @rover.position.y.should == old_y
        @rover.facing.should be_north
      end

      it 'should not move north when there is not space' do
        # setup
        old_x = @rover.position.x
        @rover.land(@plateau, old_x, @plateau.upper_y)
        old_y = @rover.position.y
        old_y.should == @rover.plateau.upper_y
        old_y.should >= 0

        # try to move
        @rover.move

        # check
        @rover.position.x.should == old_x
        @rover.position.y.should == old_y
        @rover.facing.should be_north
      end
    end
  end

  context 'When facing west' do
    before do
      @rover.west
      @rover.facing.should be_west
    end

    context 'Turning' do
      it 'should be facing south if instructed to left' do
        @rover.left
        @rover.facing.should be_south
      end

      it 'should be facing north if instructed to right' do
        @rover.right
        @rover.facing.should be_north
      end
    end

    context 'Moving forward' do
      it 'should move west one step when there is space to go' do
        # setup
        old_x = @rover.position.x
        old_y = @rover.position.y
        old_x.should > 0

        # try to move
        @rover.move

        # check
        @rover.position.x.should == old_x - 1
        @rover.position.y.should == old_y
        @rover.facing.should be_west
      end

      it 'should not move west when there is space but occupied' do
        # setup
        old_x = @rover.position.x
        old_y = @rover.position.y
        old_x.should > 0

        other_rover = MarsRover::Rover.new
        other_rover.land(@rover.plateau, old_x - 1, old_y)
        @rover.plateau.occupied?(old_x- 1, old_y).should be_true

        # try to move
        @rover.move

        # check
        @rover.position.x.should == old_x
        @rover.position.y.should == old_y
        @rover.facing.should be_west
      end

      it 'should not move west when there is not space' do
        # setup
        old_y = @rover.position.y
        @rover.land(@plateau, 0, old_y)
        old_x = @rover.position.x

        # try to move
        @rover.move

        # check
        @rover.position.x.should == old_x
        @rover.position.y.should == old_y
        @rover.facing.should be_west
      end
    end
  end

  context 'When facing south' do
    before do
      @rover.south
      @rover.facing.should be_south
    end

    context 'Turning' do
      it 'should be facing east when instructed to left' do
        @rover.left
        @rover.facing.should be_east
      end

      it 'should be facing west when instructed to right' do
        @rover.right
        @rover.facing.should be_west
      end
    end

    context 'Moving forward' do
      it 'should move south one step when there is space to go' do
        # setup
        old_x = @rover.position.x
        old_y = @rover.position.y
        old_y.should > 0

        # try to move
        @rover.move

        # check
        @rover.position.x.should == old_x
        @rover.position.y.should == old_y - 1
        @rover.facing.should be_south
      end

      it 'should not move south when there is space but occupied' do
        # setup
        old_x = @rover.position.x
        old_y = @rover.position.y
        old_y.should > 0

        other_rover = MarsRover::Rover.new
        other_rover.land(@rover.plateau, old_x, old_y - 1)
        @rover.plateau.occupied?(old_x, old_y - 1).should be_true

        # try to move
        @rover.move

        # check
        @rover.position.x.should == old_x
        @rover.position.y.should == old_y
        @rover.facing.should be_south
      end

      it 'should not move south when there is not space' do
        # setup
        old_x = @rover.position.x
        @rover.land(@plateau, old_x, 0)
        old_y = @rover.position.y

        # try to move
        @rover.move

        # check
        @rover.position.x.should == old_x
        @rover.position.y.should == old_y
        @rover.facing.should be_south
      end
    end
  end

  context 'When facing east' do
    before do
      @rover.east
      @rover.facing.should be_east
    end

    context 'Turning' do
      it 'should be facing north when instructed to left' do
        @rover.left
        @rover.facing.should be_north
      end

      it 'should be facing south when instructed to right' do
        @rover.right
        @rover.facing.should be_south
      end
    end

    context 'Move Forward' do
      it 'should move east one step when there is space to go' do
        # setup
        old_x = @rover.position.x
        old_y = @rover.position.y
        old_x.should < @rover.plateau.upper_x

        # try to move
        @rover.move

        # check
        @rover.position.x.should == old_x + 1
        @rover.position.y.should == old_y
        @rover.facing.should be_east
      end

      it 'should not move east when there is space but occupied' do
        # setup
        old_x = @rover.position.x
        old_y = @rover.position.y
        old_x.should < @rover.plateau.upper_x

        other_rover = MarsRover::Rover.new
        other_rover.land(@rover.plateau, old_x + 1, old_y)
        @rover.plateau.occupied?(old_x + 1, old_y).should be_true

        # try to move
        @rover.move

        # check
        @rover.position.x.should == old_x
        @rover.position.y.should == old_y
        @rover.facing.should be_east
      end

      it 'should not move east when there is not space' do
        # setup
        old_y = @rover.position.y
        @rover.land(@plateau, @plateau.upper_x, old_y)
        old_x = @rover.position.x

        # try to move
        @rover.move

        # check
        @rover.position.x.should == old_x
        @rover.position.y.should == old_y
        @rover.facing.should be_east
      end
    end

  end
end
