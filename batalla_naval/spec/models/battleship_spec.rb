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

end