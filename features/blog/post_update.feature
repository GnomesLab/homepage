@crystal
Feature: post update
  As a company we want to be able to update our posts

  Background:
    Given I am signed in
    And There is 1 post
    And I am on the edit post page

  Scenario: page header
    Then I should see the generic header
    And I should see "Blog" selected in the header

  Scenario: I should not be able to edit posts when im not logged in
    And I am not signed in
    And I am on the edit post page
    Then I should be on the login page

  Scenario: I should be able to edit posts
    And I fill in "Title" with "title edited"
    And I fill in "Text" with "text edited"
    And I press "Submit your post"
    Then I should see "Post was successfully updated."
    And I should see "title edited"
    And I should see "text edited"

  Scenario: invalid post validation
    Given I have an invalid title
    And I fill the post form
    And I press "Submit your post"
    Then I should see "Oops! Your post could not be updated."

  Scenario: I should be able to cancel the edition
    Then I follow "cancel"
    Then I should be on the friendly url post page

  Scenario: I should see the our profile column
    Then I should see "Our profile"

  Scenario: page footer
    Then I should see the generic footer