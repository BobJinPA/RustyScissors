require 'watir-webdriver'
require_relative 'watir/init'

$b = Watir::Browser.new :ie

$b.goto 'http://en.wikipedia.org/wiki/Comparison_of_programming_languages_(string_functions)'

first_table = $b.table(:class => 'wikitable sortable jquery-tablesorter')
puts first_table.row_count
first_table.get_column_names
ada = first_table.link(:title => 'Ada (programming language)')
puts ada.text
ada.verify_value "Bob"
ada.verify_value "Ada"
#puts "top edge value: #{ada.left_edge_absolute}"

puts first_table[1][1].text
puts first_table.get_cell_data(1, "Languages")

second_table = $b.table(:class => 'vertical-navbox nowraplinks')
puts second_table.html
puts second_table.row_count

$b.close