# QTP Flavor
module Watir
  class CheckBox
    alias_method :orig_set, :set

    def set(*args)
      if args[0].to_s.upcase != '<SKIP>' then
        orig_set(args[0])
      end
    end

    def verify_value_checked(expected_val)
      if expected_val != '<SKIP>'
        self.getROProperty('checked') == expected_val
      end
    end

    def set_tf(val)
      self.set val
    end

  end
end