require 'watir-webdriver'
require_relative 'watir/init'
b = Watir::Browser.new :chrome
b.goto 'file:///Users/joshludwig/Ruby/RustyScissors/html/forms_with_input_elements.html'

puts "Testing check box getROproperty should be false"
puts b.checkbox(:value => 'bowling').getROProperty('selected')

puts "Test setting bowling to true"
b.checkbox(:value => 'bowling').set true
puts "Testing check box getROproperty should be true"
puts b.checkbox(:value => 'bowling').getROProperty('selected')

puts "Test setting bowling to false"
b.checkbox(:value => 'bowling').set false
puts "Testing check box getROproperty should be false"
puts b.checkbox(:value => 'bowling').getROProperty('selected')

puts "Test click method bowling should be true then"
b.checkbox(:value => 'bowling').click
puts b.checkbox(:value => 'bowling').getROProperty('selected')




