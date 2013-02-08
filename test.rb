
require 'watir-webdriver'
require 'nokogiri'
require_relative 'watir/init'

#I wrote the code in this module while recreating QTP functions in WATIR
module Watir
  class Table
    def column_count (row = 0)
      self.trs[row].tds.size
    end

    def row_count
      self.trs.size
    end

    def get_column_names
      column_names = Array.new
      self.ths.each do |heading|
        column_names.push heading.text
      end
      column_names
    end

    def get_column(column_name)
      self.get_column_names.index(column_name)
    end

    def get_cell_data(row, col)
      if col.is_a? String then
        col = get_column(col)
      end
      self.tr(:index=>row).td(:index=>col).text
    end
  end
end

$b = Watir::Browser.new :chrome

# open wiki page
$b.goto 'http://en.wikipedia.org/wiki/Comparison_of_programming_languages_(string_functions)'
index_table = $b.table(:class => 'wikitable sortable jquery-tablesorter')


#1 directly reference each cell using the table object
starttime1 = Time.new
for i in (1...index_table.row_count)
  puts "#{i}  #{index_table[i][1].text}"
end
endtime1 = Time.new

#2 convert table to array object and do stuff
starttime2 = Time.new
index_table_array = index_table.to_a
for i in (1...index_table.row_count)
  puts "#{i}  #{index_table_array[i][1]} "
end
endtime2 = Time.new

#3 same thing using nokogiri
starttime3  = Time.new
#index_table_array = index_table.to_a
#for i in (1...index_table.row_count)
#  puts "#{i}  #{index_table_array[i][1]} "
#end
index_table = $b.table(:class => 'wikitable sortable jquery-tablesorter')

it_array=index_table.to_a
#puts it_array

#printing the final result
for i in (1...it_array.size)
  puts it_array[i][1]
end

endtime3 = Time.new



$b.close

puts " -------------------------------------------------------------- "
puts "Results"
puts " -------------------------------------------------------------- "
puts "Directly from Table object = #{starttime1 - endtime1}"
puts "Convert to Array object = #{starttime2 - endtime2}"
puts "Nokogiri goodness = #{starttime3 - endtime3}"
puts " -------------------------------------------------------------- "


