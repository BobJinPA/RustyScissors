module Watir

  class Table
    def column_count (row = 0)
      self.trs[row].tds.size
    end

    def row_count
      self.trs.size
    end

    def get_column_names
      column_name = Array.new
      self.ths.each do |heading|
        column_name.push heading.text
      end
      column_name
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