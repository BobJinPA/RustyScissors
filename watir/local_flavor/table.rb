module Watir

  class Table
    def get_table_row (columns_list, input_values, verification_type=:true)
      table_array = self.to_a
      column_hash = Hash.new
      columns_list.split(";").each do |column|
        column_hash.merge!(column => self.get_column(column))
      end
      puts column_hash
      puts self.class
      puts self.row_count
      @selected_row = -1
      for i in (1...self.row_count)
        puts i
        if self[i][column_hash["Languages"]] =~ /Clojure/ then
          @selected_row = i
          break
        end
      end
      puts @selected_row
      actual_value = self[@selected_row][column_hash["Format"]]
      puts actual_value
      #return hash_of_output_values
    end


  end
end