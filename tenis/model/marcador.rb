class Marcador
	attr_reader :games, :sets

	def initialize
		@games = []
		@sets = []
	end

	def agregarGame(jugador, partido)
		@games.push(jugador.nombre)
		
		if @games.count(jugador.nombre) == 6
			@sets.push(jugador.nombre)
			resetGames
		end

		if @sets.count(jugador.nombre) == 2
			partido.ganador = jugador.nombre
		end
	end

	def resetGames
		@games = []
	end


end
