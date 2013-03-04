# Local Flavor
module Watir

  class Table
    def get_row (search_hash, verification_type = true)
      output_hash = Hash.new
      array_table = self.to_a
      columns = self.get_column_names
      match_count = 0
      first_match = -1
      #array_table.each do |row|
      for i in 0...array_table.size
        row_found_it = 1
        search_hash.each_pair do |key,value|
          if (array_table[i][columns.index(key)] =~ /^#{value}$/).nil? then
            row_found_it = row_found_it * 0
          end
        end
        if row_found_it == 1 then
          match_count = match_count + 1
          if first_match == -1 then
            first_match = i
            columns.each do |column|
              output_hash.merge!(column => array_table[i][self.get_column(column)] )
            end
          end
        end
      end
      return output_hash, match_count
    end

  end
end