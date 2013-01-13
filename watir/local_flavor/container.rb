module Watir
  module Container

    def verify(*args)
      if args[0].to_s.upcase != "<SKIP>" then
        assert_exists
        actual_value = self.text
        if actual_value == args[0]
          puts "Passed.  Expected value displays: #{args[0]}"
        else
          puts "Failed.  Expected: #{args[0]} -- Actual: #{actual_value}"
        end
      end
    end
  end
end