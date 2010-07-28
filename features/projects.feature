@wip @mt
Feature: projects page
  In order to trust Gnomeslab ability to produce deliverables of the highest quality
  As a visitor I have the ability to browse their projects portfolio

  Background: 
    Given I am on the projects page
    And Gnomeslab have 10 projects

  Scenario: page header
    Then I should see the generic header

  Scenario: paginator is not visible with less than 6 projects
    Given Gnomeslab have less than 6 projects
    Then I should see the projects list with 5 projects
    And I shouldn't see the paginator

  Scenario: paginator is visible with more than 6 or more projects
    When Gnomeslab have more than 6 projects
    Then I should see the projects list with 5 projects
    And I should see the paginator

  Scenario: projects description
    When Gnomeslab have more than 5 project
    Then I should see the projects list with 5 projects
    And I should see the projects title
    And I should see the projects subtitle
    And I should see the projects date
    And I should see the projects image
    And I should a link to the project
    And I should a link to the project category

  # FIXME: If the data is loaded at the background level you only need to assert that it's being displayed as intended
  Scenario: right column project categories
    Given Gnomeslab has projects with the categories Product, Security
    Then I should see 2 links in the categories list
    And I should see a link to the category Product
    And I should see a link to the category Security

  # TODO
  Scenario: right column contact teaser
  Scenario: page footer