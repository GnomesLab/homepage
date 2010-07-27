@pdc
Feature: about gnomeslab
  As a visitor of the gnomeslab website
  I should have an informative page about the company
  So I can understand what they do, how they do it and who does it
  And I should also get a grasp about their working philosophy
  And their working location and contacts

  Background:
    Given I am on the about page

  Scenario: page header
    Then I should see the generic header

  Scenario: about us content
    Then I should see "About us"
    And I should see "How do we do it?"
    And I should see "Meet the Team!"
    And I should see "Have a project?"
  
  Scenario: right column more info menu
    Then I should see "Friendly and very approachable"
    And I should see "Standards and User Experience"
    And I should see "Agile Development practitioners"
    And I should see "We use Ruby on Rails and other agile tools"
    And I should see "We respond to you, not investors"
    
  Scenario: What do we do content
    Then I should see "About us"
    And I should see "Gnomeslab is different."

  Scenario: How we do it content
    Then I should see "How do we do it?"
    And I should see "It's all about user experience"

  Scenario: Working philosophy content
    Then I should see "Meet the Team!"
    And I should see "Mr. Red"
    And I should see "Mr. Green"
    And I should see "Mr. Blue"
    And I should see "Paws"

  Scenario: About us content
    Then I should see "Have a project?"
    And I should see "Don't let your project fail."

  Scenario: the about page should have a footer
    Then I should see the generic footer