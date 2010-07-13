Feature: about gnomeslab
  As a visitor of the gnomeslab website
  I should have an informative page about the company
  So I can understand what they do, how they do it and who does it
  And I should also get a grasp about their working philosophy
  And their working location and contacts

  Background:
    Given I am on the about page

  Scenario: the about page should have a header
    Then I should see the generic header

  Scenario: about us content
    Then I should see the "About us"
    And I should see the overview content
    And I should see the team overview
  
  Scenario: right column more info menu
    Then I should see "More info"
    And I should see "About us"
    And I should see "What do we do"
    And I should see "How we do it"
    And I should see "Working philosophy"

  Scenario: right column flikr feed
    #todo: flikr feed tests (photos) DELAYED
    
  Scenario: What do we do content
    When I follow "What do we do"
    Then I should see the "What do we do content"

  Scenario: How we do it content
    When I follow "How we do it"
    Then I should see the "How we do it"

  Scenario: Working philosophy content
    When I follow "Working philosofy"
    Then I should see the "Working philosophy"

  Scenario: About us content
    When I follow "About us"
    Then I should see the "About us content"

  Scenario: the about page should have a footer
    Then I should see the generic footer