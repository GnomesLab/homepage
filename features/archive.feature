@wip @dba
Feature: Posts archive
  In order to make it easier for our visitors to find the posts they are looking for
  GnomesLab catalogs its entries by date in its archive, allowing its visitors to browse all entries by year and month

  Background:
    Given There are 10 posts

  Scenario: The archive is available to guests
    Given I am not authenticated
    When I am on the posts page
    Then I should see "Archive"

  Scenario: The archive is available to guests
    Given I have an account
    And I am authenticated
    When I visit the posts page
    Then I should see "Archive"