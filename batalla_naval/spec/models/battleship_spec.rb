require_relative '../../app/models/Board.rb'
require_relative '../spec_helper.rb'
require 'matrix'

describe 'Battleship' do

  before (:each) do
    @board = Board.new 5,5
  end

  it 'create a Board' do
    expect(@board.kind_of? Board).to eq true
  end

  it 'should create a 5x5 Board' do
    @board.matriz.row_count.should be 5
    @board.matriz.column_count.should be 5
  end

  it 'should create small ship in 3:3 location' do
    @board.put_small_ship 3,3
    expect(@board.matriz[3,3].nombre).to eq "SmallShip"
  end

  it 'should create large ship in 3:3 location' do
    @board.put_large_ship 3,3
    expect(@board.matriz[3,3].nombre).to eq "LargeShip"
    expect(@board.matriz[3,4].nombre).to eq "LargeShip"
  end

end