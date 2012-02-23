Feature: Add a new project to Stag
  So that I can let Stag know which Pivotal Tracker project I want to tag
  As a registered user
  I want to add a project by adding my project's Pivotal Tracker id

  Background: 
    Given I have the following Pivotal Tracker project
      | id | name |
      | 330799 | HubMed |

  Scenario: I have no projects yet
    Given I am on the homepage
    When I click "Add a Pivotal Tracker project"
    And I enter my project id
    And I enter my project name
    And I press "Create"
    Then I should see 1 project
    And I should see my project name
  