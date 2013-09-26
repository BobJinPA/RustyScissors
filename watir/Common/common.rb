module Common

  def self.compareList_Contains (strVerificationName, strActualValue, strExpectedValue)
    arrExpectedValue = strExpectedValue.split(";")
    #strActualValue.gsub!(" ", "")
    arrActualValue = strActualValue.split(";")
    blnAllContains = nil
    blnContains = nil
    arrExpectedValue.each do |expected|
      arrActualValue.each do |actual|
        if /#{actual}/ =~ expected then
          blnContains = true
        else
          blnContains = false
        end
        break if blnContains == true
      end
      if ((blnAllContains == nil and blnContains == true) or (blnAllContains == true and blnContains == true)) then
        blnAllContains = true
      else
        blnAllContains = false
      end
    end
    if blnAllContains == true then
      puts strVerificationName + " Contains: Test Passed: Expected: " + strExpectedValue + " - Is contained in - Actual: " + strActualValue
    else
      puts strVerificationName + " Contains: Test Failed: Expected: " + strExpectedValue + " - Is NOT contained in - Actual: " + strActualValue
    end
  end

  def self.compareList_OnlyContains (strVerificationName, strActualValue, strExpectedValue)
    arrExpectedValue = strExpectedValue.split(";")
    #strActualValue.gsub!(" ", "")
    arrActualValue = strActualValue.split(";")
    if arrExpectedValue.count == arrActualValue.count then
      if (arrExpectedValue.count - 1) < 0 then
        puts strVerificationName + " Verification - Only Contains Expected Empty List"
        return
      else
        blnOnlyContains = true
      end
      arrExpectedValue.each do |expected|
        blnOnlyContains = false
        arrActualValue.each do |actual|
          if /#{actual}/ =~ expected then
            blnOnlyContains = true
            break if blnOnlyContains == true
          end
          break if blnOnlyContains == true
        end
      end
    else
      blnOnlyContains = false
    end
    if blnOnlyContains == true then
      puts strVerificationName + " Only Contains: Test Passed: Actual: "+ strActualValue + " - Only Contains " + "Expected: " + strExpectedValue
    else
      puts strVerificationName + " Only Contains: Test Failed: Actual: "+ strActualValue + " - Does NOT Only Contain " + "Expected: " + strExpectedValue
    end
  end

  def self.compareList_DoesNotContain (strVerificationName, strActualValue, strExpectedValue)
    arrExpectedValue = strExpectedValue.split(";")
    arrActualValue = strActualValue.split(";")
    blnAllContains = nil
    blnContains = nil
    arrExpectedValue.each do |expected|
      arrActualValue.each do |actual|
        if /#{actual}/ =~ expected then
          blnContains = true
        else
          blnContains = false
        end
        break if blnContains == true
      end
      if ((blnAllContains == nil and blnContains == true) or (blnAllContains == true and blnContains == true)) then
        blnAllContains = true
      else
        blnAllContains = false
      end
    end
    if blnAllContains == false then
      puts strVerificationName + " Does Not Contains: Test Passed: Expected: " + strExpectedValue + " - Is NOT contained in - Actual: " + strActualValue
    else
      puts strVerificationName + " Does Not Contains: Test Failed: Expected: " + strExpectedValue + " - Is contained in - Actual: " + strActualValue
    end
  end

  def self.compareList_ContainsInOrder (strVerificationName, strActualValue, strExpectedValue)
    blnContainsInOrder = true
    arrExpectedValue = strExpectedValue.split(";")
    arrActualValue = strActualValue.split(";")
    if arrExpectedValue.count > arrActualValue.count then
      blnContainsInOrder = false
    else
      for i in 0...arrExpectedValue.count
        if /#{arrActualValue[i]}/ !~ arrExpectedValue[i] then
          blnContainsInOrder = false
          break
        end
      end
    end
    if blnContainsInOrder == true then
      puts strVerificationName + " Contains In Order: Test Passed: Expected: " + strExpectedValue + " - Is contained in order - Actual: " + strActualValue
    else
      puts strVerificationName + " Contains In Order: Test Failed: Expected: " + strExpectedValue + " - Is NOT contained in order - Actual: " + strActualValue
    end
  end

end















