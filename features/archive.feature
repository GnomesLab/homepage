@crystal
Feature: Posts archive
  In order to make it easier for our visitors to find the posts they are looking for
  GnomesLab catalogs its entries by date in its archive, allowing its visitors to browse all entries by year and month

  Background:
    Given There are 10 posts

  Scenario: The archive is available to guests
    Given I am not signed in
    When I am on the posts page
    Then I should see the box title set to "Archives"

  Scenario: The archive is available to registered members
    Given I have an account
    And I am signed in
    When I am on the posts page
    Then I should see the box title set to "Archives"

  Scenario: Archived years
    When I am on the posts page
    Then the archived years "2010" should be available

  Scenario: Active year
    When I am on the posts page
    Then "2010" should be the active archive year

  Scenario: Active year archived months
    Given I am on the posts page
    Then I should see the correct archive tree structure
    