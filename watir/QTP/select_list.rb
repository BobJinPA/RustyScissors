#QTP Flavor
module Watir
  class Select
    alias_method :orig_select, :select

    def getROProperty(property)
      case property.downcase
        when 'all items'
          all_item = self.options.to_a
          all_items_text = Array.new
          all_item.each do |item|
            all_items_text.push item.text
          end
          return all_items_text.join(';')
      end
    end

    def getitem(index)
      return self.options[index].text
    end

  end
end