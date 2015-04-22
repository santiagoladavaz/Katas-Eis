require 'rspec'
require_relative '../model/marcador'
require_relative '../model/jugador'
require_relative '../model/partido'

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
			marcador = Marcador.new
			partido = Partido.new(jugador, jugador_dos, marcador)
			jugador.sumarPunto(jugador_dos, partido)
			jugador.puntos.should eq 1
		end

		it 'deberia restar un punto si el oponente tiene ventaja y hago un punto' do
			jugador = Jugador.new('Santi')
			jugador_dos = Jugador.new('Federer')
			marcador = Marcador.new
			partido = Partido.new(jugador, jugador_dos, marcador)
			jugador.sumarPunto(jugador_dos, partido)
			jugador_dos.sumarPunto(jugador, partido)
			jugador.sumarPunto(jugador_dos, partido)
			jugador_dos.sumarPunto(jugador, partido)
			jugador.sumarPunto(jugador_dos, partido)
			jugador_dos.sumarPunto(jugador, partido)
			jugador_dos.sumarPunto(jugador, partido)
			jugador.sumarPunto(jugador_dos, partido)
			jugador_dos.puntos.should eq 3
		end

		it 'deberia ganar game si hago 4 puntos y los puntos deben ser 0 nuevamente' do
			jugador = Jugador.new('Santi')
			jugador_dos = Jugador.new('Federer')
			marcador = Marcador.new
			partido = Partido.new(jugador, jugador_dos, marcador)
			jugador.sumarPunto(jugador_dos, partido)
			jugador.sumarPunto(jugador_dos, partido)
			jugador.sumarPunto(jugador_dos, partido)
			jugador.sumarPunto(jugador_dos, partido)
			marcador.games.count(jugador.nombre).should eq 1
			jugador.puntos.should eq 0
			jugador_dos.puntos.should eq 0
		end
	end
end