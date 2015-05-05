class Board
  require_relative 'SmallShip.rb'
  require 'matrix'

  attr_accessor :matriz
  
  
  def initialize(rows, columns)
    @matriz = Matrix.build(rows,columns){0}
  end

  def put_small_ship(x,y)
  	@matriz.send(:[]=,x,y,SmallShip.new)		
  end

 def is_empty(x,y)
 	@matriz[3,3] == 0
 end


end