
Then(/^I read the data from the spreadsheet$/) do
	require 'spreadsheet'
	Spreadsheet.client_encoding = 'UTF-8'
	@myRoot = File.join(File.dirname(__FILE__),'/')
	book = Spreadsheet.open "#{@myRoot}Zohocrm_login.xls"
	# book = Spreadsheet.open 'excel-file.xls'
	book.worksheets
	obj_repo = book.worksheet 'obj_repo'
	user_data = book.worksheet 'user_data'
	login = book.worksheet 'login'
	
	@login_row = {}
	login.each do |row|
		row.each do |x| 
			@login_row[row[0]] = row[1..3]
		end
	end
	@obj_repo_row = {}
	obj_repo.each do |row|
		row.each do |x| 
			@obj_repo_row[row[0]] = row[1..3]
		end
	end
	@user_data_row = {}
	user_data.each do |row|
		row.each do |x| 
			@user_data_row[row[0]] = row[1]
		end
	end
end

Then(/^I enter to "(.*?)"$/) do |arg1|
 obj_info=@obj_repo_row["#{arg1}"]
 user_info=@user_data_row["#{arg1}"]
 @browser.iframe(:name , "zohoiam").text_field(:name, "#{obj_info[1].to_s}").set("#{user_info}")
end
 
Then(/^I click to "(.*?)"$/) do |arg1|
 obj_info=@obj_repo_row["#{arg1}"]
@browser.iframe(:name , "zohoiam").button(:id, "#{obj_info[1].to_s}").click
sleep (6)
end

Then(/^I click the "(.*?)" button$/) do |arg1|
  obj_info=@obj_repo_row["#{arg1}"]
 if( @browser.image(:src , "https://contacts.zoho.com/file?ID=46778702&fs=thumb").wait_until_present)
  @browser.image(:src , "https://contacts.zoho.com/file?ID=46778702&fs=thumb").click
  @browser.button(:class, "#{obj_info[1].to_s}").click
end
end

#Click Leads menu (id)
Then(/^I click to "(.*?)" menu$/) do |arg1|
obj_info=@obj_repo_row["#{arg1}"]
 @browser.a(:id , "#{obj_info[1].to_s}").click
end

#click Create New leads using  button 
Then(/^I click to "(.*?)" button$/) do |arg1|
obj_info=@obj_repo_row["#{arg1}"]
if(@browser.button(:value, "#{obj_info[1].to_s}").wait_until_present)
@browser.button(:value, "#{obj_info[1].to_s}").click
end
end

#text_field for company
Then(/^I enter "(.*?)" text to text field$/) do |arg1|
 obj_info=@obj_repo_row["#{arg1}"]
 user_info=@user_data_row["#{arg1}"]
 @browser.text_field(:name, "#{obj_info[1].to_s}").set("#{user_info}")
end


Then(/^I select the option "(.*?)" in select list "(.*?)"$/) do |arg1, arg2|
obj_info=@obj_repo_row["#{arg1}"]
obj_info_2=@obj_repo_row["#{arg2}"]
  if (@browser.select_list(:name,"#{obj_info_2[1].to_s}").wait_until_present)
  sleep 2
  @browser.select_list(:name,"#{obj_info_2[1].to_s}").option(:value,"#{obj_info[1].to_s}").select
end
end

#calcualter iimage to clcik
Then(/^I click to "(.*?)" image$/) do |arg1|
obj_info=@obj_repo_row["#{arg1}"]
  @browser.image(:class,"#{obj_info[1].to_s}").click
end

Then(/^I click to "(.*?)","(.*?)","(.*?)","(.*?)" button in Calculater$/) do |arg1, arg2, arg3, arg4|
  @browser.window(:title,'Calculator').use do
   @browser.button(:value, "#{arg1}").click
   @browser.button(:value, "#{arg2}").click
   @browser.button(:value, "#{arg3}").click
   @browser.button(:value, "#{arg4}").click
   @browser.window(:title,'Calculator').close
end
end

#browser minimize and maximise and find the document
Then(/^I click to "(.*?)" menu exit$/) do |arg1|
obj_info=@obj_repo_row["#{arg1}"]
 if (@browser.a(:id,"menu_more").exists?)
	@browser.refresh
	@browser.a(:id,"#{obj_info[1].to_s}").click
	else
	@browser.a(:id,"#{obj_info[1].to_s}").click
end
end

Then(/^I should click to "(.*?)" link using "(.*?)"$/) do |arg1, arg2|
obj_info=@obj_repo_row["#{arg1}"]
obj_info1=@obj_repo_row["#{arg2}"]
sleep (2)
if(@browser.iframe(:id,"#{obj_info[1].to_s}").span(:class,"#{obj_info1[1].to_s}").wait_until_present)
 @browser.iframe(:id,"#{obj_info[1].to_s}").span(:class,"#{obj_info1[1].to_s}").click
end
end

Then(/^I attach a new document for "(.*?)"$/) do |arg1|
  @browser.file_field.set "C:\Users\Yatin\Desktop\Document.xlsx"
   sleep(5)
end

  Then(/^I should click to "(.*?)" link button$/) do |arg1|
 @browser.iframe(:id, "externalIframe").span(:id,"upload_rht_panel").input(:type,"file").click
 end
  
#click the radio button
Then(/^I click to "(.*?)" radio button$/) do |arg1|
obj_info=@obj_repo_row["#{arg1}"]
 if (@browser.radio(:value, "#{obj_info[1].to_s}").checked?)
 puts "Radio Button already checked"
else
@browser.radio(:value, "#{obj_info[1].to_s}").set
end
end

Then (/^I click to "(.*?)" image inorder to add the contact$/)do |arg1|
obj_info=@obj_repo_row["#{arg1}"]
if(@browser.image(:src,"#{obj_info[1].to_s}").wait_until_present)
@browser.image(:src,"#{obj_info[1].to_s}").click
end
end

Then (/^I interact with window having title "(.*?)"$/) do |arg1|
sleep 20
counter = 0
if (arg1=="Zoho CRM - Home Page"|| arg1=="Open")
@browser.driver.switch_to.window(@browser.driver.window_handles[0])
else
@browser.windows.each do |win|
	if (win.title == arg1)
	@browser.driver.switch_to.window(@browser.driver.window_handles[counter])
	else
		counter = counter +1
	end
end
end
end

And (/^I click to "(.*?)" link$/)  do |arg1|
@browser.a(:href,"javascript:;").when_present.click
end

Then (/^I click to "(.*?)" span$/) do |arg1|
obj_info=@obj_repo_row["#{arg1}"]
@browser.span(:id,"#{obj_info[1].to_s}").click
end
Then (/^I send "(.*?)"$/) do |arg1|
@browser.file_field(:name, "multiupload_file").set "C:\\Users\\Yatin\\Desktop\\document.txt"
end


Then(/^I should check the "(.*?)"  matches with tabledata "(.*?)"$/) do |arg1, arg2|
  obj_info=@obj_repo_row["#{arg1}"]
user_info=@user_data_row["#{arg2}"]
sleep (4)
if (@browser.a(:id, "#{obj_info[1].to_s}").wait_until_present)
if (@browser.a(:id, "#{obj_info[1].to_s}").text == "#{user_info.to_s}")
		puts "Text matches"
		else
		puts "Text does not matches"
end
else
puts "element not found"
end
end
