class Marcador
	attr_reader :games, :sets

	def initialize
		@games = []
		@sets = []
	end

	def agregarGame(jugador, partido)
		@games.push(jugador.nombre)
	end

end
