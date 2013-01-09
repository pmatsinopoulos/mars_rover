require 'spec_helper'

describe MarsRover::Rover do
  before do
    @rover = MarsRover::Rover.new
  end

  context 'When facing north' do
    before do
      @rover.north
      @rover.facing.should be_north
    end

    it 'should be facing west if instructed to left' do
      @rover.left
      @rover.facing.should be_west
    end

    it 'should be facing east if instructed to right' do
      @rover.right
      @rover.facing.should be_east
    end
  end

  context 'When facing west' do
    before do
      @rover.west
      @rover.facing.should be_west
    end

    it 'should be facing south if instructed to left' do
      @rover.left
      @rover.facing.should be_south
    end

    it 'should be facing north if instructed to right' do
      @rover.right
      @rover.facing.should be_north
    end
  end

  context 'When facing south' do
    before do
      @rover.south
      @rover.facing.should be_south
    end

    it 'should be facing east when instructed to left' do
      @rover.left
      @rover.facing.should be_east
    end

    it 'should be facing west when instructed to right' do
      @rover.right
      @rover.facing.should be_west
    end
  end

  context 'When facing east' do
    before do
      @rover.east
      @rover.facing.should be_east
    end

    it 'should be facing north when instructed to left' do
      @rover.left
      @rover.facing.should be_north
    end

    it 'should be facing south when instructed to right' do
      @rover.right
      @rover.facing.should be_south
    end
  end
end
