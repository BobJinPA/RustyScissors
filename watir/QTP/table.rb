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
      self.tr(:index => row).td(:index => col).text
    end



    def to_a
      #create an array of the table. One element for each cell
      doc = Nokogiri::HTML.parse(self.html)
      dataArray = Array.new()
      doc.xpath("//td").each do |element|
        dataArray << (element.text)
      end
      #this converts one dim array to two dims
      table_array = Array.new
      for i in (0...self.row_count)
        tinyArray = Array.new
        for j in (0...3)     #3 should be index_table.column_count
          tinyArray << dataArray[0]
          dataArray.delete_at(0)
        end
        table_array << tinyArray
      end
      table_array
    end


  end
end