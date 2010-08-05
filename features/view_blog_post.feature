@wip @pdc
Feature: view post and comments
  In order to allow our visitors to read a post with more detail
  Gnomeslab website provides them with a post view page.
  Within this page, the visitor can not only view the whole post, but also its comments.
  Furthermore, we allow our visitors to engage with the content through the use of the new comment feature.
  
  Background:
    Given There is 1 post
    And I am on the view post page

  Scenario: page header
    Then I should see the generic header

  Scenario: page footer
    Then I should see the generic footer

  Scenario: blog post
    Then I should see the post's user
    And I should see the post's title
    And I should see the post's date
    And I should see the post's title
    And I should see the post's body
    # And I should see the post's comment count
    # And I should see the post's tag list
    # And I should see the New comment internal link


   # Scenario: right column archives
   #   Then I should see "Archives"
   #   And I should see "2010"
   # 
   # Scenario: right column popular tags
   #   Then I should see "Popular Tags"
   # 
   # Scenario: right column related posts
   #   Then I should see "Related posts"
   # 
   # Scenario: the post should have a user, title, date, body, comment count, new comment internal link and tags
   #   And I have a post
   #   Then I should see the user name
   #   And I should see the title
   #   And I should see the date
   #   And I should see its body
   #   And I should see the comment count
   #   And I should see its tags
   #   And I should see the "New comment" internal link
   #   
   # Scenario: admin should be able to edit posts
   #   And I have a post
   #   When I follow "Edit"
   #   And I fill in "Title" with "title"
   #   And I fill in "body" with "body"
   #   And I press "Update Post"
   #   Then I should see "successfully updated"
   # 
   # Scenario: admin should be able to delete posts
   #   And I have a post
   #   And I follow "Destroy"
   #   Then I should see "Post sucessfully deleted"
   #   
   # Scenario: a post with no comments should display 0 comments
   #    And I have a post
   #    And I dont have comments
   #    Then I should see "0 comments"
   # 
   # Scenario: the comment should have username, email, website, title and body
   #   And I have a comment
   #   Then I should see the creator username
   #   And I should not see the email
   #   And I should see the comment title
   #   And I should see the comment body
   # 
   # Scenario: add comment form
   #   Then I should see a text area for username
   #   And I should see a text area for email
   #   And I should see a text area for website
   #   And I should see a text area for content
   #   And I should have a "submit comment" button
   #   
   # Scenario: add a comment form, sucessfully created comment
   #   And I have valid data for a comment form
   #   And I fill the comment form
   #   And I press "Submit"
   #   Then I should see "Sucessfully created a comment"
   #   And comment count should up by one
   # 
   # Scenario: username validation for comment form
   #   And I have an invalid name
   #   And I fill the comment form
   #   And I press "Submit"
   #   Then I should see "You need to provide a valid name"
   #   
   # Scenario: email validation for comment form
   #   And I have an invalid email
   #   And I fill the comment form
   #   And I press "Submit"
   #   Then I should see "You need to provide a valid email"
   #   
   # Scenario: website is not mandatory for the comment submission
   #   And I have an invalid website
   #   And I fill the comment form
   #   And I press "Submit"
   #   Then I should see "Sucessfully created comment"
   # 
   # Scenario: content validation for comment form
   #   And I have an invalid content
   #   And I fill the comment form
   #   And I press "Submit"
   #   Then I should see "You need to provide a valid content"
   #   
   # Scenario: admin should be able to edit comments
   #   And I have a comment
   #   When I follow "Edit"
   #   And I fill in "Title" with "title"
   #   And I fill in "Content" with "body"
   #   And I press "Update Comment"
   #   Then I should see "sucessfully updated"
   # 
   # Scenario: admin should be able to delete comments
   #   And I have a comment
   #   And I follow "Delete"
   #   Then I should see "Comment sucessfully deleted"
   # 
   # Scenario: the blog post should have a footer
   #   Then I should see the generic footer