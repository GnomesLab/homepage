Feature: home page
  As a visitor of the gnomeslab website
  I should see information about gnomeslab, its team, culture and services
  So that i learn what they do and who they are

  Background:
    Given I am on the home page

  Scenario: the homepage should have a header
    Then I should see the generic header
  
  # the rotator might be implemented on a second phase
  # Scenario: the homepage should have the rotator rotating rotatable stuff
  
  Scenario: the homepage should have a "Who are we" section on the body
    Then I should see "Who are we"
    
  Scenario: the homepage should have a "What we do" section on the body
    Then I should see "What we do"
    
  Scenario: the homepage should have a "Our culture" section on the body
    Then I should see "Our culture"
    
  Scenario: the homepage should have a "Meet the team" section on the body
    Then I should see "Meet the team"
    
  Scenario: the homepage should have a "Featured project" section on the body
    Then I should see "Featured project"
  
  Scenario: the blog post should have a footer
    Then I should see the generic footer