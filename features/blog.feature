@crystal
Feature: blog page
  Gnomeslab wishes to communicate with its visitors and update them on its projects and rambles.
  The corporation´s blog is the communication tool of choice to connect with our visitors.

  Background:
    Given There are 10 posts
    And I am on the posts page

  Scenario: page header
    Then I should see the generic header

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
    And I should see the 2 latest posts delete button
    And I should see the 2 latest posts edit link

  Scenario: Only authenticated users see the edit and delete options for each post
    Given I am not signed in
    When I am on the posts page
    Then I should not see the 2 latest posts edit link
    And I should not see the 2 latest posts delete button

  Scenario: paginator
    Then I should see the posts paginator
    
  Scenario: recent posts
    Then I should see the recent posts title
    And I should see the 5 most recent post titles
    
  Scenario: popular posts
    Then I should see the popular posts title
    And I should see the 5 most popular post titles

  Scenario: right column archives
    Then I should see archives

  Scenario: page footer
    Then I should see the generic footer