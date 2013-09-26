require 'watir-webdriver'
require_relative 'watir/init'
b = Watir::Browser.new :chrome
b.goto ''

#puts b.checkbox(:id=>'bbop-check-box').getROProperty('selected')
#puts b.select_list(:id => 'searchDropdownBox').getROProperty('All Items')
puts b.select_list(:id => 'SearchScopeCFDropDownList').VerifyDoesNotContain('SearchOption','StartsWith')

