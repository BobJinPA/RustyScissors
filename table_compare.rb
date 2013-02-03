
require 'watir-webdriver'
require 'nokogiri'
require_relative 'watir/init'

$b = Watir::Browser.new :ff
$b.goto 'http://en.wikipedia.org/wiki/Comparison_of_programming_languages_(string_functions)'
#id the table
index_table = $b.table(:class => 'wikitable sortable jquery-tablesorter')

it_array=index_table.to_a
puts it_array

#printing the final result
for i in (1...it_array.size)
  puts it_array[i][1]
end
$b.close














