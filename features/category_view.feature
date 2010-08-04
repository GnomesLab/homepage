Feature: projects page
  In order to trust Gnomeslab ability to produce deliverables of the highest quality
  As a visitor I have the ability to browse their projects portfolio by category

  Background: 
    Given Gnomeslab has 3 categories with 10 projects
    And I'm at one of the categories page

  Scenario: page header
    Then I should see the generic header

  Scenario: breadcrumb
    Then I should see the breadcrumb
    And the breadcrumb should contain a link to the projects page
    And the breadcrumb should contain a link to the current category

  Scenario: projects category
    Given I see 5 projects 
    Then all the projects should belong to the current category

  Scenario: paginator is visible with more than 6 or more projects
    When the category has more than 6 projects
    Then I should see the projects list with 5 projects
    And I should see the paginator

  Scenario: paginator is not visible with less than 6 projects
    Given the category has less than 6 projects
    And I'm at one of the categories page
    Then I should see the projects list with 5 projects
    And I shouldn't see the paginator

  Scenario: right column project categories
    Then I should see the categories list
    And I should see links to all the projects categories

  Scenario: right column contact teaser
    Then I should see the contact teaser
    And I should see "contact us"
    And I should see the contact link

  Scenario: page footer
   Then I should see the generic footer