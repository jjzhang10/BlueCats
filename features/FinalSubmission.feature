Feature: Applicant can't modify application after submission

Scenario: Application is created and submitted
  Given I am logged in as applicant
  Then I should see "New Volunteer Application"
  Given I finished an application  
  Then I should see "Submit"
  Then I should see "Edit"
  When I follow "Submit"
  Then I should not see "Edit"