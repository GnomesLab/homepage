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
  
  Scenario: post validations for name
    When I fill in "Title" with "title"
    And I fill in "Content" with "content"
    And I fill in "Tags" with "RoR"
    And I press "Create Post"
    Then I should see "You need to provide a name"
  
  Scenario: post validations for title
    When I fill in "Name" with "John"
    And I fill in "Content" with "content"
    And I fill in "Tags" with "RoR"
    And I press "Create Post"
    Then I should see "You need to provide a title"
    
  Scenario: post validations for content
    When I fill in "Name" with "John"
    When I fill in "Title" with "title"
    And I fill in "Tags" with "RoR"
    And I press "Create Post"
    Then I should see "You need to provide some content"
    
  Scenario: post validations for tags
    When I fill in "Name" with "John"
    When I fill in "Title" with "title"
    And I fill in "Content" with "content"
    And I press "Create Post"
    Then I should see "You need to provide some tags"