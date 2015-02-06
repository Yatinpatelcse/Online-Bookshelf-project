Feature: Login to Zoho CRM and Create the Leads and Validates the Leads

Scenario: Login to Zoho CRM

Given I open a browser
Then I read the data from the spreadsheet
Then I go to the url "www.zoho.com/crm/lp/login.html"
Then I enter to "username" 
Then I enter to "password"
Then I click to "Loginbutton"
Then I should see "Welcome Yatinkumar at Quanta Computers"
Then I click to "Campaigns" menu
Then I click to "NewCampaigns" button
Then I enter "CampaignName" text to text field
And  I select the option "Type" in select list "Advertisement"
And  I select the option "Status" in select list "Complete"
Then I click to "Calculator" image
Then I click to "2","4","7","=" button in Calculater
Then I click to "Save" button
Then I should see "Test Campaign Name"
Then I click the "Logout" button
Then I should see "You are now signed out of Zoho CRM"
And I close the browser
