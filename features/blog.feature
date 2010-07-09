@wip
Feature: blog page
  In order to let the community know what we are up to
  The blog page should provide a way for the staff to create blog posts
  And provide a way for all readers to comment on them

  Scenario: the blog page Blog title should be visible
    Given I am on the blog page
    Then I should see "blog"
    And I should not see "404 page not found"
    
  Scenario: I should be able to create posts
    Given I am on the blog page
    When I follow "New Post"
    When I fill in "Name" with "pedro"
    And I fill in "Title" with "title"
    And I fill in "Content" with "body"
    And I press "Create Post"
    Then I should see "successfully created"
    
  Scenario: I should be able to edit posts
    Given I am on the blog page
    And I have a post
    When I follow "Edit"
    And I fill in "Title" with "title"
    And I fill in "Content" with "body"
    And I press "Update Post"
    Then I should see "successfully updated"
    
  Scenario: I should be able to delete posts
    Given I am on the blog page
    And I have a post
    And I follow "Back"
    And show me the page
    And I follow "Destroy"
    And show me the page
    Then I should not see "contenido"
    
  # Scenario: I should be able to delete comments
  #   Given I am an admin
  #   And I am on the blog page
  #   And I click "comments"
  #   And I click "delete" on one comment
  #   Then I should see "Comment sucessfully deleted"
  # 
  # Scenario: Everyone should be able to create comments
  #   Given I am on the blog page
  #   And there is at least 1 blog post
  #   And I click "comments"
  #   And I fill in title with "title"
  #   And I fill in body with "body"
  #   And I click submit
  #   Then I should see "Comment sucessfully created"