Feature: home page
  As a visitor of the gnomeslab website
  I should see information about gnomeslab, its team, culture and services
  So that i learn what they do and who they are

  Scenario: the homepage should have a header
  Scenario: the homepage should have a footer
  
  Scenario: the homepage should have the rotator rotating rotatable stuff
  
  Scenario: the homepage should have a "Who are we" section on the body
    Given I am on the home page
    Then I should see "Who are we?"
    
  Scenario: the homepage should have a "What we do" section on the body
    Given I am on the home page
    Then I should see "What we do"
    
  Scenario: the homepage should have a "Our culture" section on the body
    Given I am on the home page
    Then I should see "Our culture"
    
  Scenario: the homepage should have a "Meet the team" section on the body
    Given I am on the home page
    Then I should see "Meet the team"
    
  Scenario: the homepage should have a "Featured project" section on the body
    Given I am on the home page
    Then I should see "Featured project"