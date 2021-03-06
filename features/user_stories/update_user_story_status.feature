Feature: Update User Stories Statuses
	In order to report in which stage is an user story development
	As a Product Owner
	I want to update user stories statuses

	Background:
		Given I'm logged in
		And an user story exists

	Scenario: Updating user story status through form
		When I update this user story status
		Then I should see this user story listed on the correct status column

	@javascript
	Scenario: Updating user story status through drag and drop
		When I drag and drop this user story to another status column
		Then I should see this user story listed on the correct status column
