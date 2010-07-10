Feature: about gnomeslab
  As a visitor of the gnomeslab website
  I should have an informative page about the company
  So I can understand what they do, how they do it and who does it
  And I should also get a grasp about their working philosophy
  And their working location and contacts

  Scenario: the about page should have a header
  Scenario: the about page should have a footer

  Scenario: the about page should have the about section
    Given I am on the about page
    Then I should see the "About" title
    And I should see the about content
    And I should see a "Contact us" link

  Scenario: the about page should have a right menu with "What we do"
    Given I am on the about page
    And I follow "What do we do"
    Then I should see the "What do we do" information

  Scenario: the about page should have a right menu with "How we do it"
    Given I am on the about page
    And I follow "How we do it"
    Then I should see the "How we do it" information

  Scenario: the about page should have a right menu with "Who does it?"
    Given I am on the about page
    And I follow "Who does it"
    Then I should see the "Who does it" information

  Scenario: the about page should have a right menu with "Working philosofy"
    Given I am on the about page
    And I follow "Working philosofy"
    Then I should see the "Working philosofy" information

  Scenario: the about page should have a right menu with "Working location"
    Given I am on the about page
    And I follow "Working location"
    Then I should see the "Working Location" information

  Scenario: the about page should have a right menu with "Contacts"
    Given I am on the about page
    And I follow "Contacts"
    Then I should see the contacts information
