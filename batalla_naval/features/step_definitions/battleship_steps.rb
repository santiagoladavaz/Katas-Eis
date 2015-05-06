require_relative '../../app/models/Board.rb'

Given(/^a board with dimensions "(.*?)" x "(.*?)"$/) do |arg1, arg2|
  @board = Board.new(arg1.to_i, arg2.to_i)
end

Given(/^I create a small ship in position "(.*?)"$/) do |coord|
	@res = @board.put_small_ship(coord)  
end

Then(/^position "(.*?)" is not empty$/) do |coord|
 expect(@board.is_empty(coord)).to eq false
end


Given(/^I create a large ship in position "(.*?)"$/) do |coord|
	@board.put_large_ship(coord)  
end

Then(/^positions "(.*?)" is not empty$/) do |coord|
 expect(@board.is_empty(coord)).to eq false
end

Then(/^I get HayBarco$/) do
   expect(@res).to eq "HayBarco"
end

