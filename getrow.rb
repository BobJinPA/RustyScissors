
require 'watir-webdriver'
require 'nokogiri'
require_relative 'watir/init'
$b = Watir::Browser.new :ff
$b.goto 'http://en.wikipedia.org/wiki/Comparison_of_programming_languages_(string_functions)'

index_table = $b.table(:class => 'wikitable sortable jquery-tablesorter', :index => 0)
puts index_table.get_row({'Languages' => 'VB.*'})




$b.close
