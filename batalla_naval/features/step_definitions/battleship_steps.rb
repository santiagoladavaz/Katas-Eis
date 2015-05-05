require_relative '../../app/models/Board.rb'

Given(/^a board with dimensions "(.*?)" x "(.*?)"$/) do |arg1, arg2|
  @board = Board.new(arg1.to_i, arg2.to_i)
end

Given(/^I create a small ship in position "(.*?)"$/) do |coord|
	a = coord.split(":")
	x = a[0].to_i
	y= a[1].to_i
	@board.put_small_ship(x,y)  
end

Then(/^position "(.*?)" is not empty$/) do |coord|
 a = coord.split(":")
 x = a[0].to_i
 y= a[1].to_i
 expect(@board.is_empty(x,y)).to eq false
end


Given(/^I create a large ship in position "(.*?)"$/) do |coord|
	a = coord.split(":")
	x = a[0].to_i
	y= a[1].to_i
	@board.put_large_ship(x,y)  
end

Then(/^positions "(.*?)" is not empty$/) do |coord|
 a = coord.split(":")
 x = a[0].to_i
 y= a[1].to_i
 expect(@board.is_empty(x,y)).to eq false
 expect(@board.is_empty(x,y+1)).to eq false
end

