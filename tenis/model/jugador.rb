class Jugador
	attr_reader :nombre, :puntos

	def initialize(nombre)
		@nombre = nombre
		@puntos = 0
	end

	def sumarPunto(otro_jugador)
=begin
	Si mi oponente tiene ventaja y yo hago un punto se le resta uno a el
=end
		if(otro_jugador.puntos == 4 && @puntos == 3)
			otro_jugador.restarPunto
			return
		end
			
		@puntos += 1
	end

	def restarPunto
		@puntos-=1
	end

end
