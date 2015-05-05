class Board
  attr_accessor :matriz
  require 'matrix'
  
  def initialize(rows, columns)
    @matriz = Matrix.build(rows,columns){0}
  end

  def put_small_ship(x,y)
  	@matriz.send(:[]=,x,y,1)		
  end

end