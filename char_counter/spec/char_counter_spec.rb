require 'rspec'
require_relative '../model/cuenta_corriente'

describe 'CuentaCorriente' do

	describe 'initialize' do

		it 'deberia comenzar con saldo 0' do
			cuenta_corriente = CuentaCorriente.new
			cuenta_corriente.saldo.should eq 0
		end
		
	end

	describe 'acreditar' do

		it 'deberia incremantar el saldo con el monto acreditado' do
			cuenta_corriente = CuentaCorriente.new
			cuenta_corriente.acreditar 100
			cuenta_corriente.saldo.should eq 100
		end
		
	end

	describe 'debitar' do

		it 'deberia debitar el saldo con el monto a debitar' do
			cuenta_corriente = CuentaCorriente.new
			cuenta_corriente.acreditar 100
			cuenta_corriente.debitar 10
			cuenta_corriente.saldo.should eq 90
		end

	end

	describe 'bloqueada' do

		it 'deberia permitir operar si no esta bloqueada' do
			cuenta_corriente = CuentaCorriente.new
			cuenta_corriente.acreditar 100
			cuenta_corriente.debitar 110
			cuenta_corriente.saldo.should eq -10
		end

		it 'no deberia permitir operar si esta bloqueada' do
			cuenta_corriente = CuentaCorriente.new
			cuenta_corriente.acreditar 100
			cuenta_corriente.debitar 201
			cuenta_corriente.debitar 10
			cuenta_corriente.saldo.should eq -101
		end 
	end

end