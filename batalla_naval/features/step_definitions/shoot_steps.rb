require_relative '../../app/models/Board.rb'

Given(/^a board with dimension "(.*?)" x "(.*?)"$/) do |x, y|
  @board = Board.new(x.to_i, y.to_i)
end

Given(/^a large ship in position "(.*?)"$/) do |coord|
  a = coord.split(":")
  x = a[0].to_i
  y= a[1].to_i
  @board.put_large_ship(x,y) 
end


Given(/^I shoot to position "(.*?)"$/) do |coord|
  a = coord.split(":")
  x = a[0].to_i
  y= a[1].to_i
  @res_of_shoot = @board.shoot(x,y)
  @res_of_second_shoot = @board.shoot(x,y)
end

Then(/^I get hit$/) do
	expect(@res_of_shoot).to eq 'HIT'
end

Then(/^I get water$/) do
  expect(@res_of_second_shoot).to eq 'WATER'
end

Then(/^I get sink$/) do
  expect(@res_of_shoot).to eq 'SINK'
end


