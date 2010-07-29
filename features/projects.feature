@wip @mt
Feature: projects page
  In order to trust Gnomeslab ability to produce deliverables of the highest quality
  As a visitor I have the ability to browse their projects portfolio

  Background: 
    Given Gnomeslab has 10 projects
    And I am on the projects page

  Scenario: page header
    Then I should see the generic header

  Scenario: projects description
    And Gnomeslab has more than 5 project
    Then I should see the projects list with 5 projects
    And I should see the title of 5 projects
    And I should see the subtitle of 5 projects
    # And I should see the date of 5 projects
    # And I should see the projects image
    # And I should a link to the project
    # And I should a link to the project category

  Scenario: paginator is not visible with less than 6 projects
    Given Gnomeslab has less than 6 projects
    And I am on the projects page
    Then I should see the projects list with 5 projects
    And I shouldn't see the paginator
  
  Scenario: paginator is visible with more than 6 or more projects
    When Gnomeslab has more than 6 projects
    Then I should see the projects list with 5 projects
    And I should see the paginator
  
  # FIXME: If the data is loaded at the background level you only need to assert that it's being displayed as intended
  Scenario: right column project categories
    Given Gnomeslab has projects with the categories Product, Security
    Then I should see 2 links in the categories list
    And I should see a link to the category Product
    And I should see a link to the category Security
  
  # TODO
  Scenario: right column contact teaser
  Scenario: page footer