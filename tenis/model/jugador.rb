class Jugador
	attr_reader :nombre, :puntos

	def initialize(nombre)
		@nombre = nombre
		@puntos = 0
	end

	def sumarPunto(otro_jugador, partido)
=begin
	Si mi oponente tiene ventaja y yo hago un punto se le resta uno a el
=end
		if(otro_jugador.puntos == 4 && @puntos == 3)
			otro_jugador.restarPunto
			return
		end
=begin
	Si estoy 40 a otro_jugador.puntos <=30 o tengo ventaja,gane el game.
=end
	
		if(@puntos == 3 && otro_jugador.puntos < 3 || @puntos == 4 && otro_jugador.puntos == 3)
			partido.ganoGame(self)
			reset
			otro_jugador.reset
			return
		end
		
		@puntos += 1
	end
	
	def restarPunto
		@puntos-=1
	end

	def reset
		@puntos=0
	end

end
