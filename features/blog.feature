Feature: blog page
  As visitor of the gnomeslab website
  I should have a page with blog entries
  So I can read and comment on them
  And get involved in the subsequent discussions

  Scenario: the blog page should have a header
  Scenario: the blog post should have a footer

  Scenario: the blog page should have the 2 latest posts visible
    Given I am on the blog page
    And I have posts
    Then I should see the 2 latest posts
  
  Scenario: the blog page should have a right menu with archives
  Scenario: the blog page should have a right menu with popular tags
  
  Scenario: the blog post should have a post with username, title, date, content, tags and a link for comments
    Given I am on the blog page
    And I have a post
    Then I should see the creator name
    And I should see the title
    And I should see the date
    And I should see its content
    And I should see its tags
    And I should have a link for comments
  
  Scenario: the blog page should have a paginator