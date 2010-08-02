@wip @mt
Feature: projects page
  In order to trust Gnomeslab ability to produce deliverables of the highest quality
  As a visitor I have the ability to browse their projects portfolio by category

  Background: 
    Given Gnomeslab has 3 categories with 10 projects
    And I'm at one of the categories page

  Scenario: page header
    Then I should see the generic header

  Scenario: the projects category
    Then the visible projects must belong to the selected category