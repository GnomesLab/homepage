@crystal
Feature: post create
  As an admin
  I want to create posts
  So others can drool at my awesome writing skills

  Background:
    Given I am logged in
    And I am on the post create page
    
  Scenario: I should not be able to create posts when im not logged in
    And I am not authenticated
    And I am on the post create page
    Then I should see "Not Authorized!"

  Scenario: I should be able to create posts
    And I fill in "Title" with "title"
    And I fill in "Text" with "text"
    And I press "Submit your post"
    Then I should see "successfully created"

  Scenario: title validation for post form
    Given I have an invalid title
    And I fill the post form
    And I press "Submit your post"
    Then I should see "Oops! Your message could not be sent."

  Scenario: content validation for post form
    Given I have an invalid content
    And I fill the post form
    And I press "Submit"
    Then I should see "Oops! Your message could not be sent."

  # Scenario: tags validation for post form
  #   Given I have an invalid tag
  #   And I fill the post form
  #   And I press "Submit"
  #   Then I should see "You need to provide valid tags"