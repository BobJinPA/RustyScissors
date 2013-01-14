module Watir
  module UserEditable

    alias_method :orig_set, :set

    def set(*args)
      if args[0].to_s.upcase != "<SKIP>" then
        orig_set(args)
      end
    end

    def verify_value(*args)
      if args[0].to_s.upcase != "<SKIP>" then
        assert_exists
        actual_value = @element.text
        if actual_value == args[0]
          puts "Passed.  Expected value displays: #{args[0]}"
        else
          puts "Failed.  Expected: #{args[0]} -- Actual: #{actual_value}"
        end
      end
    end


=begin
    def set_jquery(input,method)
       if strInput != "<SKIP>" then
    	   self.set input
    	   $b.runScript(cleanjQueryQuotes(method))
    	end
    end
=end

  end
end