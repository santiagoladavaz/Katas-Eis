class Board
  attr_accessor :matriz
  require 'matrix'
  
  def initialize(rows, columns)
    @matriz = Matrix.build(rows,columns){0}
  end


end