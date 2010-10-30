@crystal
Feature: blog page
  Gnomeslab wishes to communicate with its visitors and update them on its projects and rambles.
  The corporation´s blog is the communication tool of choice to connect with our visitors.

  Background:
    Given There are 10 posts
    And There are unpublished posts
    And I am on the posts page

  Scenario: page header
    Then I should see the generic header
    And I should see "Blog" selected in the header

  Scenario: the blog page should have the 2 latest posts visible
    Then I should see the 2 latest posts

  Scenario: blog post
    Given I am signed in
    When I am on the posts page
    Then I should see the 2 latest posts title
    And I should see the 2 latest posts date
    And I should see the 2 latest posts body
    And I should see the 2 latest posts creator name
    And I should see the 2 latest posts tags
    And I should see the 2 latest posts comment count
    And I should see the 2 latest posts delete link
    And I should see the 2 latest posts edit link
    And I should be able to follow to the 2 latest posts pages

  Scenario: not see unpublished posts
    Given I am not signed in
    And I am on the posts page
    Then I should not see 2 unpublished posts

  Scenario: see unpublished posts
    Given I am signed in
    And I am on the posts page
    Then I should see 2 unpublished posts

  Scenario: Only authenticated users see the edit and delete options for each post
    Given I am not signed in
    When I am on the posts page
    Then I should not see the 2 latest posts edit link
    And I should not see the 2 latest posts delete button

  Scenario: paginator
    Then I should see the posts paginator

  Scenario: right column recent posts
    Then I should see the recent posts title
    And I should see the 5 most recent post titles

  Scenario: right column popular posts
    Then I should see the popular posts title
    And I should see the 5 most popular post titles

  Scenario: right column archives
    Then I should see "Archives"
    And I should see the correct archive tree structure

  Scenario: page footer
    Then I should see the generic footer