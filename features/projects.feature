Feature: projects page
  As a user
  I want to have access to a portfolio of the gnomeslab company
  So i can drool in awe on their amazing work and beg them to let me have the honour of hiring them
  
  Background: Given I am on the projects page

  Scenario: the projects page should have a header
    Then I should see the generic header
  
  Scenario: right column links to each project category
    Then I should see "Category 1"
    And I should see "Category 2"
    And I should see "Category 3"
  
  Scenario: the projects page should have the latest 5 projects visible
    Then I should see "Project 1"
    And I should see "Project 2"
    And I should see "Project 3"
    And I should see "Project 4"
    And I should see "Project 5"
    
  Scenario: the projects page should have a paginator
    Then I should see "Prev"
    And I should see "Next"
  
  Scenario: the project should have a title, a thumbnail image, a date, a short description and a case study link
    Then I should see the project title
    And I should see a thumbnail image
    And I should see the project date
    And I should see a short description
    And I should have a "Case study" link
      
  Scenario: the blog post should have a footer
    Then I should see the generic footer