module Watir
  class Radio
    alias_method :orig_set, :set
    
    def getROProperty (property)
      case property.downcase
        when 'checked'
          return self.set?
      end
    end

    
  end
end