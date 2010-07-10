Feature: post view page
  As a user
  I want to be able to view a single post
  With all the comments expanded
  So i get a better grasp of the topic and its discussion
  
  Scenario: the post page should have a header
  Scenario: the post page should have a footer
  
  Scenario: the post page should have a right menu with archives
  Scenario: the post page should have a right menu with popular tags
  
  Scenario: the post should have a username, title, date, content and tags
    Given I am on the post view page
    And I have a post
    Then I should see the creator name
    And I should see the title
    And I should see the date
    And I should see its content
    And I should see its tags

  Scenario: the comment should have username, email, website, title and content
    Given I am on the post view page
    And I have a comment
    Then I should see the creator name
    And I should not see the email
    And I should see the comment title
    And I should see the comment content
  
  Scenario: the comment form should be visible
    Given I am on the post view page
    Then I should see a text area for username
    And I should see a text area for email
    And I should see a text area for website
    And I should see a text area for content
    And I should have a "submit comment" button