Feature: Manage project environments
  So that I can tag my Tracker stories with a label that matches their deployment environment
  As a registered user
  I want to add and remove Stag environments for my projects

  Background: 
    Given the following projects
      | pivotal_tracker_id | name |
      | 12345678 | MumbleFurtz |

  Scenario: I add an environment to my project
    Given I am on the projects page
    When I click "Add an environment" within "the first project"
    And I fill in "Label" with "Staging"
    And I press "Save"
    Then I should see "Staging" within "the first project"
  
  
  