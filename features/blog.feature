Feature: blog page
  As visitor of the gnomeslab website
  I should have a page with blog entries
  So I can read and comment on them
  And get involved in the subsequent discussions

  Background:
    Given I am on the blog page
    And I have posts

  Scenario: the blog page should have a header
    Then I should see the generic header

  Scenario: the blog page should have the 2 latest posts visible
    Then I should see the 2 latest posts

  Scenario: right column should have top 4 popular posts
    Then I should see the top 4 popular posts
  
  Scenario: right column archives
    Then I should see archives
    And I should see "2010"

  Scenario: right column popular tags
    Then I should see tags
  
  Scenario: blog post
    Then I should see the creator name
    And I should see the title
    And I should see the date
    And I should see its content
    And I should see its tags
    And I should have a link for comments
  
  Scenario: the blog page should have a paginator if there are 2 or more posts
    Given I have 2 blog entries
    Then I should see "Next"
    And I should see "Previous"
    
  Scenario: the blog page should not have a paginator if there are 1 or less posts
    Given I have 1 post
    Then I should not see "Next"
    And I should not see "Previous"
    
  Scenario: the blog post should have a footer
    Then I should see the generic footer