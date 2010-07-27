@wip

Feature: projects page
  In order to see what projects Gnomeslab are involved
  As a visitor
  I want to see the Gnomeslab portfolio

  Background: 
    Given I am on the projects page

  Scenario: the projects page should have a header
    Then I should see the generic header

  Scenario: right column should list the categories
    Given Gnomeslab have projects with the categories Product, Security
    Then I should see 2 links in the categories list
    And I should see a link to the category Product
    And I should see a link to the category Security
  
  Scenario: the pagination shouldn't be visible if there is only 5 projects
    Given Gnomeslab have 5 projects
    Then I should see the projects list
    And I should see 5 projects
    And I shouldn't see the pagination

  Scenario: the pagination should be visible if there is more than 5 projects
    Given Gnomeslab have 10 projects
    Then I should see the projects list
    And I should see 5 projects
    And I should see the pagination

  Scenario: projects description
    Given Gnomeslab have 1 project
    Then I should see the projects list
    And I should see the project title
    And I should see the project date
    And I should see the project image
    And I should a link to the project
    And I should a link to the project category