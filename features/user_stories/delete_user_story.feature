Feature: Deleting an User Story
	In order to discart an obsolete user story
	As a Product Owner
	I want to delete an user story
	
	Background:
		Given I log in
		And an user story exists
	
	Scenario:
		When I delete this user story
		Then I should no longer see this user story
	
	@javascript
	Scenario:
		When I delete this user story
		And I accept the confirmation to delete
		Then I should no longer see this user story
