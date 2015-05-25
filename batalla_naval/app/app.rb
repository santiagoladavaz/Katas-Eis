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
        @coordenadas=params[:coordenadas]
        @tablero = session[:tablero]
        a = @coordenadas.split(":")
        session[:x] = a[0].to_i
        session[:y]= a[1].to_i
        session[:cantBarcos] = session[:cantBarcos] + 1
        @tablero.put_small_ship(@coordenadas)
        
        session[:tablero] = @tablero
        render 'batalla/index'
    end

  end
end
