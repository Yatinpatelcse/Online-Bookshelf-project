Feature: Taking a screenshot

Scenario: Deepti on demand screenshot

Given I open a browser
Then I go to the url "www.google.com"
Then I wait 5 seconds
Then I take a screenshot
And I close the browser