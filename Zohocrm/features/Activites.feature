Feature: Login to Zoho CRM and New_call under the Activities

Scenario: Login to Zoho CRM
Given I open a browser
Then I read the data from the spreadsheet
Then I go to the url "www.zoho.com/crm/lp/login.html"
Then I enter to "username" 
Then I enter to "password"
Then I click to "Loginbutton"
Then I should see "Welcome Yatinkumar at Quanta Computers"
And I wait for 8 seconds
Then I click to "Activities" menu exit
Then I click to "New_call" button
Then I enter "Subject" text to text field
Then I click to "Inbound" radio button
And  I select the option "Demo" in select list "callPurpose"
Then I click to "contact" radio button
Then I click to "search_button" image inorder to add the contact
Then I interact with window having title "Zoho CRM - Contact Name Lookup"
And I should see "Contact Name"
And I should see "PHY"
And I click to "PHY" link
Then I interact with window having title "Zoho CRM - Home Page"
Then I click to "start" span
And I wait for 8 seconds
Then I click to "stop" span
Then I click to "Save" button
Then I should see "Subject_Test"
Then I click the "Logout" button
Then I should see "You are now signed out of Zoho CRM"
And I close the browser
