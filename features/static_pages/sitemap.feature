@wip
Feature: sitemap
  As visitor of the gnomeslab website
  I need a map of all the pages
  So I can find what i want faster

  Background: 
    Given I am on the sitemap page

  Scenario: the sitemap page should have a header
    Then I should see the generic header

  Scenario: the sitemap page should have a sitemap
    Then I should see a list of all the pages
    And the page names should be links

  Scenario: right column should have a popular pages list
    Then I should see "Popular page 1"
    And I should see "Popular page 2"
    And I should see "Popular page 3"

  Scenario: right column should have some "need help" stactic content
    Then I should see "some need help text here"

  Scenario: right column should have a link to the contact page
    When I follow "Contact us"
    Then I should see the contact form

  Scenario: the sitemap page should a footer
    Then I should see the generic footer