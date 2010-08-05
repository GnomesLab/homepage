Feature: projects page
  In order to trust Gnomeslab ability to produce deliverables of the highest quality
  As a visitor I have the ability to browse their projects portfolio

  Background: 
    Given Gnomeslab has 10 projects
    And I am on the projects page

  Scenario: page header
    Then I should see the generic header

  Scenario: projects description should contain a link to the projects with the title of the projects
    Given Gnomeslab has more than 5 project
    Then I should see the projects list with 5 projects
    And the list should contain the titles with the respective links of each project

  Scenario: projects description should contain the project subtitle
    Given Gnomeslab has more than 5 project
    Then I should see the projects list with 5 projects
    And the list should contain the subtitles of each project

  Scenario: projects description should contain the project short date
    Given Gnomeslab has more than 5 project
    Then I should see the projects list with 5 projects
    And the list should contain the short date of each project 

  Scenario: projects description should contain the project image with a link to the project
    Given Gnomeslab has more than 5 project
    Then I should see the projects list with 5 projects
    And the list should contain the project image with a link to the project page

  Scenario: projects description should contain an explicit link to the project
    Given Gnomeslab has more than 5 project
    Then I should see the projects list with 5 projects
    And the list should contain an "View case study" link for each project

  Scenario: projects description should contain a link to the project category
    Given Gnomeslab has more than 5 project
    Then I should see the projects list with 5 projects
    And the list should contain the link to the project category

  Scenario: paginator is not visible with less than 6 projects
    Given Gnomeslab has less than 6 projects
    And I am on the projects page
    Then I should see the projects list with 5 projects
    And I shouldn't see the paginator

  Scenario: paginator is visible with more than 6 or more projects
    When Gnomeslab has more than 6 projects
    Then I should see the projects list with 5 projects
    And I should see the paginator

  Scenario: right column project categories
    Then I should see the categories list
    And I should see links to all the projects categories

  Scenario: right column contact teaser
    Then I should see the contact teaser
    And I should see "contact us"
    And I should see the contact link

  Scenario: page footer
   Then I should see the generic footer