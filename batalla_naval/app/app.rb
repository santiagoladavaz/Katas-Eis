require_relative 'models/Board'
require 'matrix'

module Battleship
  class App < Padrino::Application
    register Padrino::Rendering
    register Padrino::Helpers

    enable :sessions
    
    get '/' do
      File.read(File.join('public', 'index.html'))
    end

    
  
    get 'batalla' do
      session[:cantBarcos] = 0
      session[:cantHundidos] = 0
      session[:cantAgua] = 0
      render 'batalla/index'
    end


    post 'crear_tablero' do
      @ancho = params[:ancho]
      @alto = params[:alto]
      session[:alto] = @alto
      session[:ancho] = @ancho
      session[:tablero] = Board.new @ancho.to_i,@alto.to_i
      render 'batalla/index'
    end 

    post 'agregar_barco' do
        @coordenadas=params[:coordenadas_agregar]
        @radio_data = params[:checkLargo]
        @tablero = session[:tablero]
        a = @coordenadas.split(":")
        session[:x] = a[0].to_i
        session[:y]= a[1].to_i
        session[:cantBarcos] = session[:cantBarcos] + 1
        if @radio_data.eql?("largo") 
          @res_to_put_boat = @tablero.put_large_ship(@coordenadas)
        else
          @res_to_put_boat = @tablero.put_small_ship(@coordenadas)
        end
        session[:tablero] = @tablero
        render 'batalla/index'
    end

    post 'verificar_celda' do
      @tablero = session[:tablero]
      @coordenadas=params[:coordenadas]
      a = @coordenadas.split(":")
      @x = a[0].to_i
      @y = a[1].to_i
      @verificar_celda = @tablero.is_empty(@x,@y).to_s
      render 'batalla/index'
    end 

  end
end
