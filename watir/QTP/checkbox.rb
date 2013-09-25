# QTP Flavor
module Watir
  class CheckBox
    alias_method :orig_set, :set

    def set(*args)
      if args[0].to_s.upcase != '<SKIP>' then
        orig_set(args[0])
      end
    end

    def getROProperty (property)
      case property
        when 'checked'
          return self.set?
      end
    end

  end
end