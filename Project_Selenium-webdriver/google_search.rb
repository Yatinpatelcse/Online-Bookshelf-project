=begin
========
TESTCASE
=============================================================================================================
Go to Google> Search for something > Submit >Validate something showed up> Validate something didn’t show up)
==============================================================================================================
=end

require 'rubygems'
require 'selenium-webdriver'

#---variable for parameterize----
@base_url = 'https://www.google.com'
@my_search = 'Zoho CRM'
@expected_text ='CRM Software, Customer Relationship Management - Zoho ...'

# wait for a specific element to show up
wait= Selenium::WebDriver::Wait.new(:timeout => 20)

# instantiate firefox using selenium webdriver
@browser = Selenium::WebDriver.for :firefox

# repositionning and resizing browser window:
@driver.manage.window.maximize
@browser.get @base_url

element = @browser.find_element(:name => 'q')
element.send_keys @my_search

#click the element
element.submit

# wait for a specific element to show up
# is the element visible on the page?
wait.until{ @browser.find_element(:css, '#rso .g').displayed?}
@actual_text = @browser.find_element(:css, '#rso .g').text.include? "#{@expected_text}"

if @actual_text == true
  puts "Search result contain expected text: #{@expected_text}, Test pass!"
else
  puts "Search result does not contain expected text: #{@expected_text}, Test Fail!"
end

@browser.quit
