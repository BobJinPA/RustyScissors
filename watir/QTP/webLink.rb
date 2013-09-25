module Watir
  class Anchor
    alias_method :orig_click, :click
    
    def click(*args)
      if args[0].to_s.upcase != '<SKIP>' then
	self.orig_click()
      end
    end
    
  end
end