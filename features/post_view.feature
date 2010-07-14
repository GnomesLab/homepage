Feature: post view page #fixme: texting
  As a user
  I want to be able to view a single post
  With all the comments expanded
  So i get a better grasp of the topic and its discussion
  
  # TODO
  # Name: You can use a regular expression for the name that validates min & max length and assert that they are only alphanumeric + space and start with a letter
  # Email: Standard email regex
  # website: Standard URI regex for http and https
  # Content: we can assume they must have 3chars minimum and we'll see how ppl behave
  
  Background: Given I am on the post view page
  
  Scenario: the post page should have a header
    Then I should see the generic header
  
  Scenario: right column archives
    Then I should see "Archives"
    And I should see "2010"

  Scenario: right column popular tags
    Then I should see "Popular Tags"

  Scenario: right column related posts
    Then I should see "Related posts"
  
  Scenario: the post should have a username, title, date, content, comment count, new comment internal link and tags
    And I have a post
    Then I should see the creator name
    And I should see the title
    And I should see the date
    And I should see its content
    And I should see the comment count
    And I should see its tags
    And I should see the "New comment" internal link
    
  Scenario: admin should be able to edit posts
    And I have a post
    When I follow "Edit"
    And I fill in "Title" with "title"
    And I fill in "Content" with "content"
    And I press "Update Post"
    Then I should see "successfully updated"

  Scenario: admin should be able to delete posts
    And I have a post
    And I follow "Destroy"
    Then I should see "Post sucessfully deleted"
    
  Scenario: a post with no comments should display 0 comments
     Given I have a post
     And I dont have comments
     Then I should see "0 comments"

  Scenario: the comment should have username, email, website, title and content
    And I have a comment
    Then I should see the creator name
    And I should not see the email
    And I should see the comment title
    And I should see the comment content
  
  Scenario: add comment form
    Then I should see a text area for username
    And I should see a text area for email
    And I should see a text area for website
    And I should see a text area for content
    And I should have a "submit comment" button
    
  Scenario: add a comment form, sucessfully created comment
    Given I have valid data for a comment form
    And I fill the comment form
    And I press "Submit"
    Then I should see "Sucessfully created a comment"
    And comment count should up by one
  
  Scenario: username validation for comment form
    Given I have an invalid name
    And I fill the comment form
    And I press "Submit"
    Then I should see "You need to provide a valid name"
    
  Scenario: email validation for comment form
    Given I have an invalid email
    And I fill the comment form
    And I press "Submit"
    Then I should see "You need to provide a valid email"
    
  Scenario: website is not mandatory for the comment submission
    Given I have an invalid website
    And I fill the comment form
    And I press "Submit"
    Then I should see "Sucessfully created comment"
  
  Scenario: content validation for comment form
    Given I have an invalid content
    And I fill the comment form
    And I press "Submit"
    Then I should see "You need to provide a valid content"
    
  Scenario: admin should be able to edit comments
    And I have a comment
    When I follow "Edit"
    And I fill in "Title" with "title"
    And I fill in "Content" with "body"
    And I press "Update Comment"
    Then I should see "sucessfully updated"

  Scenario: admin should be able to delete comments
    And I have a comment
    And I follow "Delete"
    Then I should see "Comment sucessfully deleted"
  
  Scenario: the blog post should have a footer
    Then I should see the generic footer