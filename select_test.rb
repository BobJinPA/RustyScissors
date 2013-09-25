require 'watir-webdriver'
require_relative 'watir/init'
b = Watir::Browser.new :chrome
b.goto 'http://www.amazon.com/gp/product/B00CPTD5AQ/ref=s9_pop_gw_g60_ir03/180-6566099-8564966?pf_rd_m=ATVPDKIKX0DER&pf_rd_s=center-3&pf_rd_r=1HK69XXC98VMPRZ97Y33&pf_rd_t=101&pf_rd_p=490157971&pf_rd_i=507846'

puts b.checkbox(:id=>'bbop-check-box').getROProperty('selected')

#puts b.select_list(:id => 'searchDropdownBox').getROProperty('All Items')

