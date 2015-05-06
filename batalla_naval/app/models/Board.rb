class Board
  require_relative 'SmallShip.rb'
  require 'matrix'

  attr_accessor :matriz
  
  
  def initialize(rows, columns)
    @matriz = Matrix.build(rows,columns){Water.new}
  end

  def put_small_ship(x,y)
  	@matriz.send(:[]=,x,y,SmallShip.new)		
  end

  def put_large_ship(x,y)
    large_ship = LargeShip.new
  	@matriz.send(:[]=,x,y,large_ship)
    @matriz.send(:[]=,x,y+1,large_ship)		
  end

  
  def is_empty(x,y)
 	  @matriz[x,y] == 'WATER'
  end

  
  def shoot(x,y)
    res = @matriz[x,y].get_shoot 
    if res.eql?("SINK") || res.eql?("HIT")
      @matriz.send(:[]=,x,y,Water.new)
    end
  
    return res
  end


end