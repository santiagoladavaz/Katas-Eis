require 'rspec'
require_relative '../model/marcador'

describe 'Marcador' do

	describe 'initialize' do

		it 'deberia comenzar con games 0-0' do
			marcador = Marcador.new
			marcador.games_j1.should eq 0
			marcador.games_j2.should eq 0
		end
		
	end

end