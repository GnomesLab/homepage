@wip @pdc
Feature: tags page
  In order to allow our users to find related posts
  The blog posts should have tags
  That when clicked should show all the post with the same tags
  So users can easely search for similar posts
  
  Background:
    Given There are 10 posts
    And I am on the posts page
    And I follow "rails"

  Scenario: page header
    Then I should see the generic header

  Scenario: the tags page should have the 2 latest tagged posts visible
    Then I should see the 2 latest tagged posts
    
  Scenario: paginator
    Then I should see the posts paginator
  
  Scenario: popular posts
    Then I should see the popular posts title
    And I should see the 5 most popular post titles
        
  Scenario: page footer
    Then I should see the generic footer