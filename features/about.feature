@wip @dba
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

  Scenario: Meet the team - Diogo Almeida
    Then I should see "Diogo Almeida"
    And I should see "Founder & CEO"
    And I should see "Young entrepreneur and creative, Diogo has a constant drive to create"

  # TODO
  Scenario: Meet the team - Pedro Coutinho
  Scenario: Meet the team - Miguel Teixeira

  Scenario: our profile (right column)
    Then I should see "Friendly and very approachable"
    And I should see "Standards and User Experience"
    And I should see "Agile Development practitioners"
    And I should see "We use Ruby on Rails and other agile tools"
    And I should see "We respond to you, not investors"

  Scenario: contact us (right column)
    Then I should see "About us"
    And I should see "Gnomeslab is different."

  Scenario: the about page should have a footer
    Then I should see the generic footer
