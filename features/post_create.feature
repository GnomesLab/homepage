@crystal
Feature: post create
  As a company we want to keep our visitors and clients up-to-date.
  In order to do that, we need to have a backoffice interface that allows us to create and publish new content

  Background:
    Given I am signed in
    And I am on the new post page
    
  Scenario: I should not be able to create posts when im not logged in
    And I am not signed in
    And I am on the new post page
    Then I should see "Not Authorized!"

  Scenario: I should be able to create posts
    And I fill in "Title" with "title"
    And I fill in "Text" with "text"
    And I press "Submit your post"
    Then I should see "Post was successfully created." within "#content div.msg.msg-notice"

  Scenario: title validation for post form
    Given I have an invalid title
    And I fill the post form
    And I press "Submit your post"
    Then I should see "Oops! Your post could not be created." within "#content div.msg.msg-error"

  Scenario: content validation for post form
    Given I have an invalid content
    And I fill the post form
    And I press "Submit your post"
    Then I should see "Oops! Your post could not be created." within "#content div.msg.msg-error"

  # Scenario: tags validation for post form
  #   Given I have an invalid tag
  #   And I fill the post form
  #   And I press "Submit"
  #   Then I should see "You need to provide valid tags"