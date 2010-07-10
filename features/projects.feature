Feature: projects page
  As a user
  I want to have access to a portfolio of the gnomeslab company
  So i can drool in awe on their amazing work and beg them to let me have the honour of hiring them

  Scenario: the projects page should have a header
  Scenario: the projects page should have a footer
  
  Scenario: the projects page should have a right menu with links to each project category
  
  Scenario: the projects page should have the latest 5 projects visible
  Scenario: the projects page should have a paginator
  
  Scenario: the project should have a thumbnail image, a title, a date, a short description and a case study link
    Given I am on the projects page
    Then I should see the project title
    And I should see the project date
    And I should see a short description
    And I should have a case study link