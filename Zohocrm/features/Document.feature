Feature: Login to Zoho CRM and create and upload  the Document and Validates the Leads

Scenario: Login to Zoho CRM

Given I open Chrome
Then I read the data from the spreadsheet
Then I go to the url "www.zoho.com/crm/lp/login.html"
Then I switch to iframe "iframeName"
Then I enter to "username" 
Then I enter to "password"
Then I click to "Loginbutton"
Then I should see "Welcome Yatinkumar at Quanta Computers"
Then I click to "Document" menu exit
Then I should click to "AllFile" link using "span"
Then let me debug
Then I should click to "upload" link button
Then I interact with window having title "Open"
Then I attach a new document for "file"
Then I click the "Logout" button
Then I should see "You are now signed out of Zoho CRM"
And I close the browser
