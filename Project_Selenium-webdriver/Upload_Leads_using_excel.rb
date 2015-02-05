=begin
========
TESTCASE
=======================================
upload the Leads using the Excel file
=======================================
updates value for variable
---------------------------
1) @username = /enter your Email address/
2) @password = /Enter the password/
3) @file_path ='your_path\\3Qi-QA-Exercise\\my contact.xlsx'
=end

require 'rubygems'
require 'selenium-webdriver'

#---variable for parameterize----
@base_url = 'https://www.zoho.com/crm/lp/login.html'
@username = /enter your Email address/
@password = /Enter the password/
@file_path ='your_path\\3Qi-QA-Exercise\\Leads_contacts.xlsx'
@expected_num_of_rows = 11


# wait for a specific element to show up
wait = Selenium::WebDriver::Wait.new(:timeout => 10)

# instantiate firefox using selenium webdriver
@driver = Selenium::WebDriver.for :firefox

# repositionning and resizing browser window:
@driver.manage.window.maximize
@driver.get(@base_url)


# switch to a frame
@driver.switch_to.frame('zohoiam')

@driver.find_element(:id, 'lid').send_key @username
@driver.find_element(:id, 'pwd').send_key @password

#click the element
@driver.find_element(:id, "submit_but").click

# wait for a specific element to show up
# is the element visible on the page?

wait.until{@driver.find_element(:id =>'getStart').displayed?}
successMessage= @driver.find_element(:id =>'getStart').text
successMessage.include? 'Getting Started with Zoho CRM'

# jump to another url
@driver.get 'https://crm.zoho.com/crm/Import.do?module=Leads'

#wait.until{@driver.find_element(:id => 'tab_Leads').displayed?}
#@driver.find_element(:id => 'tab_Leads').click

#wait.until{@driver.find_element(:class, 'btn importNewBtn').displayed?}
#@driver.find_element(:class, 'btn importNewBtn').click

# wait for a specific element to show up and
# is the element visible on the page?

wait.until {@driver.find_element(:name ,'theFile').displayed?}

#upload the excel file from given variable i.e.  @file_path
@driver.find_element(:name, 'theFile').send_keys @file_path

@driver.find_element(:id,'owOperation').click
@driver.find_element(:xpath , "//form[@name='exceldo']//input[@type='submit']").click

#handle alert pop and accept
@driver.switch_to.alert.accept

# wait for a specific element to show up and
# is the element visible on the page?

wait.until {@driver.find_element(:id , 'importSubmit').displayed?}
@driver.find_element(:id, 'importSubmit').click

#wait for 2 sec
sleep (2)

# wait for a specific element to show up
# is the element visible on the page?

wait.until {@driver.find_element(:id , 'importSubmit').displayed?}
@driver.find_element(:id, 'importSubmit').click

sleep (2)
wait.until{@driver.find_element(:id, 'recordImported').displayed?}

#find the element and store the text to variable
@actual = @driver.find_element(:xpath, ".//form[@name='ImportSummary']//span[@class ='f13 pL5 btxt1']").text


if @actual.to_i == @expected_num_of_rows
  puts "Excel file successfully updated with #{@expected_num_of_rows} which is equal to actual #{@actual}"
else
  puts "Excel file  not successfully updated with #{@expected_num_of_rows} which is  not equal to actual #{@actual}"
end

@driver.quit