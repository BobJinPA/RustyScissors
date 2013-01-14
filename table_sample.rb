require 'watir-webdriver'
require_relative 'watir/init'

$b = Watir::Browser.new :ie

# open wiki page
$b.goto 'http://en.wikipedia.org/wiki/Comparison_of_programming_languages_(string_functions)'

#identify compare table
index_table = $b.table(:class => 'wikitable sortable jquery-tablesorter')

=begin
#when language is 'VB', verify index method is 'Mid(string,i,1)'
list_of_columns = "Format;Languages"
#create hash of columns and positions
column_hash = Hash.new
list_of_columns.split(";").each do |column|
  column_hash.merge!(column => index_table.get_column(column))
end
puts column_hash

#find row where language is VB
@row = -1
for i in (1...index_table.row_count)
  puts i
  if index_table.get_cell_data(i, column_hash["Languages"]) == "VB" then
    @row = i
    break
  end
end
puts @row
actual_value = index_table.get_cell_data(@row, column_hash["Format"])
puts actual_value

#read table into ruby object
table_array = index_table.to_a
puts table_array
puts table_array[0][0]
puts table_array.size



@row2 = -1
for i in (1...table_array.size)
  puts i
  if table_array[i][column_hash["Languages"]] =~ /Clojure/ then
    @row2 = i
    break
  end
end
puts @row2
actual_value = table_array[@row2][column_hash["Format"]]
puts actual_value
=end


index_table.get_table_row("Format;Languages", 'x')



$b.close