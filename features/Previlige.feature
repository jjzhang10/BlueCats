Feature: Users has different previlige

Scenario: Log in as normal applicant
	Given I am logged in as applicant
	When there are other applicants
	When I want to view other applicant's information
	Then I should see "Authorization limited."

Scenario: Log in as administrator
	Given I am logged in as administrator
	When there are other applicants
	When I want to view other applicant's information
	Then I should see "My applications"