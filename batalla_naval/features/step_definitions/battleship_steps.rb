require_relative '../../app/models/Board.rb'

Given(/^a board with dimensions "(.*?)" x "(.*?)"$/) do |x, y|
  visit '/batalla'
  fill_in(:ancho, :with => x)
  fill_in(:alto, :with => y)
  click_button "armar_tablero"
end

Given(/^I create a small ship in position "(.*?)"$/) do |coord|
  fill_in(:coordenadas_agregar, :with => coord)
  click_button "btnAgregarBarco"
end

Then(/^position "(.*?)" is not empty$/) do |coord|
  fill_in(:coordenadas, :with => coord)
  click_button "btnVerificarCelda"
  page.should have_content('')
end


