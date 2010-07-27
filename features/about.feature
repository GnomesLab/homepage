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
    When I am on Diogo Almeida profile section
    Then I should see "Diogo Almeida :: Founder"
    And I should see "Young entrepreneur and creative, Diogo has a constant drive to create"
    And I should see "diogo (dot) almeida (at) gnomeslab (dot) com"
    And I should see dbalmeida Linkedin profile link
    And I should see dbalmeida Twitter link 

  Scenario: Meet the team - Pedro Coutinho
    When I am on Pedro Coutinho profile section
    Then I should see "Pedro Coutinho :: Partner"
    And I should see "Being a seasoned IT professional, Pedro had the opportunity to work as an IT Manager"
    And I should see "pedro (dot) coutinho (at) gnomeslab (dot) com"

  Scenario: Meet the team - Miguel Teixeira
    When I am on Miguel Teixeira profile section
    Then I should see "Miguel Teixeira :: Partner"
    And I should see "After years of web development using Microsoft's ASP.net and PHP"
    And I should see "miguel (dot) teixeira (at) gnomeslab (dot) com"
    And I should see miguelfteixeira Linkedin profile link
    And I should see miguelfteixeira Twitter link

  Scenario: our profile (right column)
    Then I should see "Friendly and very approachable"
    And I should see "Standards and User Experience"
    And I should see "Agile Development practitioners"
    And I should see "We use Ruby on Rails and other agile tools"
    And I should see "We respond to you, not investors"

  Scenario: we're social (right column)
    Then I should see "We're social!"
    And I should see "Visit our Facebook group"
    And I should see "Follow Gnomeslab on Twitter"

  Scenario: contact us (right column)
    Then I should see "About us"
    And I should see "Gnomeslab is different."

  Scenario: the about page should have a footer
    Then I should see the generic footer
