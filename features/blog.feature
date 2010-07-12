Feature: blog page
  As visitor of the gnomeslab website
  I should have a page with blog entries
  So I can read and comment on them
  And get involved in the subsequent discussions

  # use fixtures or factory girl
  Background:
    Given I have posts
    Given I am on the blog page

  Scenario: the blog page should have a header
    Then I should see the generic header

  Scenario: the blog page should have the 2 latest posts visible
    Then I should see the 2 latest posts
  
  # todo: popular posts
  
  Scenario: right column archives #todo
  Scenario: right column popular tags #todo
  
  Scenario: blog post
    Then I should see the creator name
    And I should see the title
    And I should see the date
    And I should see its content
    And I should see its tags
    And I should have a link for comments
    
  # Should i add edit and destroy to this page or it stays only on the post view page?
  # 
  # Scenario: admin should be able to edit posts
  #   And I have a post
  #   When I follow "Edit"
  #   And I fill in "Title" with "title"
  #   And I fill in "Content" with "content"
  #   And I press "Update Post"
  #   Then I should see "successfully updated"
  # 
  # Scenario: admin should be able to delete posts
  #   And I have a post
  #   And I follow "Destroy"
  #   Then I should see "Post sucessfully deleted"
  
  Scenario: the blog page should have a paginator
    Then I should see "Next"
    And I should see "Previous"
    
  Scenario: the blog post should have a footer
    Then I should see the generic footer