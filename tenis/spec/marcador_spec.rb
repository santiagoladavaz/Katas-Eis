require 'rspec'
require_relative '../model/marcador'
require_relative '../model/jugador'

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


describe 'Jugador' do

	describe 'initialize' do

		it 'deberia comenzar con 0 puntos' do
			jugador = Jugador.new('Santi')
			jugador.puntos.should eq 0
		end

		it 'deberia tener un punto si hace un tanto' do
			jugador = Jugador.new('Santi')
			jugador_dos = Jugador.new('Federer')
			jugador.sumarPunto(jugador_dos)
			jugador.puntos.should eq 1
		end

		it 'deberia restar un punto si el oponente tiene ventaja y hago un punto' do
			jugador = Jugador.new('Santi')
			jugador_dos = Jugador.new('Federer')
			jugador.sumarPunto(jugador_dos)
			jugador_dos.sumarPunto(jugador)
			jugador.sumarPunto(jugador_dos)
			jugador_dos.sumarPunto(jugador)
			jugador.sumarPunto(jugador_dos)
			jugador_dos.sumarPunto(jugador)
			jugador_dos.sumarPunto(jugador)
			jugador.sumarPunto(jugador_dos)
			jugador_dos.puntos.should eq 3
		end
	end
end