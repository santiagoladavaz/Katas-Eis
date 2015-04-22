class Jugador
	attr_reader :nombre, :puntos

	def initialize(nombre)
		@nombre = nombre
		@puntos = 0
	end

	def sumarPunto
		@puntos += 1
	end

end
