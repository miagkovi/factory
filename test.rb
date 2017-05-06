#!/usr/bin/ruby

require_relative('./factory.rb')

###

puts "Factory is a #{Factory.class}"

###

Customer = Factory.new(:name, :address, :zip)

puts "Customer is a #{Customer.class}"

joe = Customer.new('Joe Smith', '123 Maple', 12345)

puts 'Access testing:'
puts joe.name == 'Joe Smith'
puts joe['name'] == 'Joe Smith'
puts joe[:name] == 'Joe Smith'
puts joe[0] == 'Joe Smith'

###

Customer2 = Factory.new(:name, :address) do
	def greeting
		"Hello, #{name}!"
	end
end

puts 'Block testing:'
puts Customer2.new('Dave', '123 Maple').greeting == 'Hello, Dave!'