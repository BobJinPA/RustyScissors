
require 'watir-webdriver'
require 'nokogiri'
require_relative 'watir/init'
b = Watir::Browser.new :chrome
b.goto 'http://en.wikipedia.org/wiki/Comparison_of_programming_languages_(string_functions)'

index_table = b.table(:class => 'wikitable sortable jquery-tablesorter', :index => 0)
puts index_table.get_row({'Languages' => 'VB.*'})

puts 'Testing child item'
puts index_table.child_item(5,1,'link',0)

puts 'Testing child item with bad type'
puts index_table.child_item(5,0,'radio',0)

puts 'Testing child item with bad index'
puts index_table.child_item(5,0,'link',45)

puts 'Testing child item count for links'
puts index_table.child_item_count(5,1,'links')

puts 'Testing child item count for radio buttons'
puts index_table.child_item_count(5,0,'radios')

b.close
