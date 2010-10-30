@crystal
Feature: home page
  As a visitor of the gnomeslab website
  I should see information about gnomeslab, its team, culture and services
  So that i learn what they do and who they are

  Background:
    Given I am on the home page

  Scenario: page header
    Then I should click the generic header
    And I should see "Home" selected in the header

  Scenario: the homepage should have a "Who are we" section on the body
    Then I should see "Who are we"
    And I should see "Gnomeslab is different."

  Scenario: the homepage should have a "Our culture" section on the body
    Then I should see "Our culture"
    Then I should see "We believe in"

  Scenario: the homepage should have a "What we do" section on the body
    Then I should see "What we do"
    Then I should see "web facing applications, services and products"

  Scenario: the homepage should have a "Meet the team" section on the body
    Then I should see "Meet the team"
    Then I should see "young and dynamic team"

  Scenario: the homepage should have a "Where are we?" section on the body
    Then I should see "Where are we"
    Then I should see "Gnomeslab is based in Lisbon"

  Scenario: the blog post should have a footer
    Given There are 5 post
    And I am on the home page
    Then I should see the generic footer
    And I should see the 5 recent posts titles
    And I should see the 3 latest Gnomeslab tweets