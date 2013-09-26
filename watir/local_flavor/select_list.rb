# Local Flavor
module Watir
  class Select
    alias_method :orig_select, :select

    def select(*args)
      if args[0].to_s.upcase != '<SKIP>' then
        orig_select(args[0])
      end
    end

    def VerifyContains(strVerificationName, strExpectedValue)
      strActualValue = self.getROProperty('all items')
      Common::compareList_Contains(strVerificationName, strActualValue, strExpectedValue)
    end

    def VerifyOnlyContains(strVerificationName, strExpectedValue)
      strActualValue = self.getROProperty('all items')
      Common::compareList_OnlyContains(strVerificationName, strActualValue, strExpectedValue)
    end

    def VerifyDoesNotContain(strVerificationName, strExpectedValue)
      strActualValue = self.getROProperty('all items')
      Common::compareList_DoesNotContain(strVerificationName, strActualValue, strExpectedValue)
    end

  end
end