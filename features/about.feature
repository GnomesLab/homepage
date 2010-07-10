Feature: about gnomeslab
  As a visitor of the gnomeslab website
  I should have an informative page about the company
  So I can unstand what they do, how they do it and who does it
  And I should also get a grasp about their working philosofy
  And their working location and contacts

  Scenario: the about page should have the header and footer

  Scenario: the about page should have the about section
    Given I am on the about page
    Then I should see the "About" section with a intruductory text
    And I should see a "contact us" link

  Scenario: the about page should have a right menu with what we do, how we do it, who does it, working philosofy, working location and contacts