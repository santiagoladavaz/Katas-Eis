class Partido 

	attr_accessor :ganador

	def initialize(jugador_1, jugador_2, marcador)
		@jugador_1 = jugador_1
		@jugador_2 = jugador_2
		@marcador = marcador
		@ganador
	end

	def ganoGame(jugador)
		@marcador.agregarGame(jugador, self)
	end

end
