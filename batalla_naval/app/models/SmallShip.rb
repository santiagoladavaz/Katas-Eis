class Ship
 
	attr_accessor :nombre

	def initialize(nombre)
	    @nombre = nombre 
	end

end


class SmallShip < Ship
 	
 	def initialize
	   super("SmallShip") 
	end

end


class LargeShip < Ship
 
	def initialize
	   super("LargeShip")
	   @parts = 2
	end

end
