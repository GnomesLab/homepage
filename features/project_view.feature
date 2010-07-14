Feature: projects page
  As a user of the website
  If I find a project interesting
  I want to be able to see a detailed description of it
  So I can learn more about that specific project
  And about gnomeslab delivery capabilities
  
  Background: 
    Given I am on the projects page

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
  
  Scenario: the project should have a title, a thumbnail image, a date and a detailed description
    Then I should see the project title
    And I should see a thumbnail image
    And I should see the project date
    And I should see a detailed description
      
  Scenario: the blog post should have a footer
    Then I should see the generic footer