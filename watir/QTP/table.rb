#QTP Flavor
module Watir

  class Table
    def column_count (row = 0)
      #self.trs[row].tds.size
      self.row.cells.length
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
        for j in (0...self.column_count) #3 should be index_table.column_count
          tinyArray << dataArray[0]
          dataArray.delete_at(0)
        end
        table_array << tinyArray
      end
      table_array
    end

    def getROProperty(property)
      case property.downcase
        when 'rows'
          return self.row_count
        when 'columns'
          return self.column_count
      end
    end

    def child_item(row, col, type, index)
      cell = self.tr(:index => row).td(:index => col)
      begin
        child = cell.send("#{type}".to_sym, :index => index)
      rescue
        puts "Error setting child element"
      end
      if child.exists?
        child
      else
        puts "Could not find element of type: #{type} or there are not #{index} elements of that type"
      end
    end

    def child_item_count(row, col, type)
      cell = self.tr(:index => row).td(:index => col)
      begin
        cell.send("#{type}".to_sym).length
      rescue
        puts "Error obtaining count for type"
      end
    end

  end
end