Feature: Login to Zoho CRM and Count number of Leads

Scenario: Count the number of Leads

Given I open a browser
Then I read the data from the spreadsheet
Then I go to the url "www.zoho.com/crm/lp/login.html"
Then I enter to "username" 
Then I enter to "password"
Then I click to "Loginbutton"
Then I should see "Welcome Yatinkumar at Quanta Computers"
Then I click to "Leads" menu
Then let me debug
Then I should check the "text"  matches with tabledata "rowText"
