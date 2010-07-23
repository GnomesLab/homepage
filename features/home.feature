@wip
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
    And I should see "Gnomeslab is different."
    
  Scenario: the homepage should have a "What We Do?" section on the body
    Then I should see "We develop websites"
    
  Scenario: the homepage should have a "Our Culture" section on the body
    Then I should see "We believe in"
    
  Scenario: the homepage should have a "Meet the team" section on the body
    Then I should see "Seriously"
    
  Scenario: the homepage should have a "Featured project" section on the body
    Then I should see "Lorem ipsum"
  
  Scenario: the blog post should have a footer
    Then I should see the generic footer