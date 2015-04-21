require 'rspec'
require_relative '../model/marcador'

describe 'Marcador' do

	describe 'initialize' do

		it 'deberia comenzar con games 0-0' do
			marcador = Marcador.new
			marcador.games.count.should eq 0
		end

		it 'deberia comenzar con sets 0-0' do
			marcador = Marcador.new
			marcador.sets.count.should eq 0
		end
		
	end

end