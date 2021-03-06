Feature: To take an screenshot after login in Zoho Crm

Scenario: Login to Zoho CRM

Given I open a browser
Then I read the data from the spreadsheet
Then I go to the url "www.zoho.com/crm/lp/login.html"
Then I enter to "username" 
Then I enter to "password"
Then I click to "Loginbutton"
Then I should see "Welcome Yatinkumar at Quanta Computers"
Then I should take an "Screenshot" 
Then I click the "Logout" button
Then I should see "You are now signed out of Zoho CRM"
And I close the browser