module Watir
  class Radio
    alias_method :orig_set, :set

    def set(*args)
      if args[0].to_s.upcase != '<SKIP>' then
        self.orig_set()
      end
    end

    def click(*args)
      if args[0].to_s.upcase != "<SKIP>" then
        self.set
      end
    end

    def select(*args)
      if args[0].to_s.upcase != "<SKIP>" then
        self.set
      end
    end

    def set_TF (value)
      if value.upcase != "<SKIP>" then
        if value.upcase == 'TRUE' then
          self.set
        end
      end
    end

    def getROProperty (property)
      case property.downcase
        when 'checked'
          return self.set?
      end
    end

    def verifyValue (value)
      if value.upcase != "<SKIP>" then
        if value.downcase == self.set?.to_s then
          return true
        else
          return false
        end
      end
    end

  end
end