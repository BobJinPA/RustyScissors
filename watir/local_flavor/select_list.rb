# Local Flavor
module Watir
  class Select
    alias_method :orig_select, :select

    def select(*args)
      if args[0].to_s.upcase != '<SKIP>' then
        orig_select(args[0])
      end
    end
  end
end