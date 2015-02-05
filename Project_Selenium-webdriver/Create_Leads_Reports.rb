=begin
========
TESTCASE
=============================================================
Create Leads Reports and delete the current updated Reports
=============================================================
updates value for variable
-------------------------------------------------------------
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
@report_name ='Leads Reports'
@report_desc ='Leads Reports for jan/2015'

# wait for a specific element to show up
wait = Selenium::WebDriver::Wait.new(:timeout => 10)

# instantiate firefox using selenium webdriver
@driver = Selenium::WebDriver.for :firefox
@driver.get @base_url

# repositionning and resizing browser window:
@driver.manage.window.maximize

# switch to a frame
@driver.switch_to.frame('zohoiam')
@driver.find_element(:id, 'lid').send_key @username
@driver.find_element(:id, 'pwd').send_key @password

#click the element
@driver.find_element(:id, "submit_but").click

# wait for a specific element to show up
# is the element visible on the page?
wait.until{@driver.find_element(:id, 'tab_Reports').displayed?}
@driver.find_element(:id, 'tab_Reports').click

# wait for a specific element to show up
# is the element visible on the page?
wait.until{@driver.find_element(:xpath, "//form[@name='NewReport']//input[@type='button']")}
@driver.find_element(:xpath, "//form[@name='NewReport']//input[@type='button']").click

# wait for a specific element to show up
# is the element visible on the page?
#select the specific text from drop down box
wait.until{@driver.find_element(:id, 'primarymodule').displayed?}
@driver.find_element(:id, 'primarymodule').find_elements(:xpath,"//option[text()='Leads']").select
@driver.find_element(:id, 'Leadsrelatedmodule').find_elements(:xpath,"//option[text()='Products']").select

#click the element
@driver.find_element(:id, 'nextBtn').click

# wait for a specific element to show up
# is the element visible on the page?
#select the specific text from drop down box
wait.until{@driver.find_element(:id,'tab2').displayed?}
@driver.find_element(:id,'tab2').click
select = @driver.find_element(:id, 'availList')
select_list = Selenium::WebDriver::Support::Select.new(select)
select_list.select_by(:text, "Lead Owner")
select_list.select_by(:text, "First Name")
select_list.select_by(:text, "Last Name")
select_list.select_by(:text, "Company")
@driver.find_element(:name, 'Button').click

#Get the current window handle before the click to element
@original_win_handle = @driver.window_handle
@driver.find_element(:id, 'btnSaveAndRun').click
@driver.window_handles.each do |handler|
  @driver.switch_to.window(handler)
end

# wait for a specific element to show up
# is the element visible on the page?
wait.until{@driver.find_element(:xpath,"//form[@name='NewReport']//input[@name='reportName']").displayed?}
@driver.find_element(:xpath,"//form[@name='NewReport']//input[@name='reportName']").send_key @report_name


@driver.find_element(:name,'reportDesc').send_key @report_desc

#find the first “SELECT” element on the page, and
#cycle through each of its OPTIONs in turn, printing out their values, and selecting each in turn.
select = @driver.find_element(:name, 'folder')
select_list = Selenium::WebDriver::Support::Select.new(select)
select_list.select_by(:text, "Lead Reports")

@driver.find_element(:name,'Button').click
sleep 3

#return back to original windows
@driver.switch_to.window(@original_win_handle)


# wait for a specific element to show up
# is the element visible on the page?
#and delete report
wait.until { @driver.find_element(:xpath, "//form[@name='NewReport']").displayed?}
@driver.find_element(:xpath, "//form[@name='NewReport']//input[@value='Delete Report']").click

#handle alert pop and accept
@driver.switch_to.alert.accept

@driver.quit