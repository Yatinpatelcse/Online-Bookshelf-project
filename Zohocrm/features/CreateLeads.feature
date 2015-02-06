Feature: Login to Zoho CRM and Create the Leads and Validates the Leads

Scenario: Login to Zoho CRM

Given I open a browser
Then I read the data from the spreadsheet
Then I go to the url "www.zoho.com/crm/lp/login.html"
Then I enter to "username" 
Then I enter to "password"
Then I click to "Loginbutton"
Then I should see "Welcome Yatinkumar at Quanta Computers"
Then I click to "Leads" menu
Then I click to "NewLeads" button
Then I enter "Company" text to text field
Then I enter "LastName" text to text field
Then I enter "FirstName" text to text field
And  I select the option "my" in select list "firstname"
Then I click to "Calculator" image
Then I click to "7","8","9","=" button in Calculater
Then I click to "Save" button
Then I should see "Mr. yatinpatelcse@gmail.com XYZP"
Then I click the "Logout" button
Then I should see "You are now signed out of Zoho CRM"
And I close the browser
