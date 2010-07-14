Scenario: post create
As an admin
I want to create posts
So others can drool at my awesome writing skills

  Background:
    Given I am on the post create page

    # TODO: refactor when features are done
  Scenario: I should be able to create posts
    When I fill in "Name" with "John"
    And I fill in "Title" with "title"
    And I fill in "Content" with "content"
    And I fill in "Tags" with "RoR"
    And I press "Create Post"
    Then I should see "successfully created"
    
  Scenario: username validation for post form
    Given I have an invalid name
    And I fill the post form
    And I press "Submit"
    Then I should see "You need to provide a valid name"
    
  Scenario: title validation for post form
    Given I have an invalid title
    And I fill the post form
    And I press "Submit"
    Then I should see "You need to provide a valid title"
    
  Scenario: content validation for post form
    Given I have an invalid content
    And I fill the post form
    And I press "Submit"
    Then I should see "You need to provide a valid content"
    
  Scenario: tags validation for post form
    Given I have an invalid tag
    And I fill the post form
    And I press "Submit"
    Then I should see "You need to provide valid tags"