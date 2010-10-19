@wip
Feature: view post
  In order to allow our visitors to read a post with more detail
  Gnomeslab website provides them with a post view page.
  Within this page, the visitor can not only view the whole post, but also its comments.
  Furthermore, we allow our visitors to engage with the content through the use of the new comment feature.
  
  Background:
    Given There are 10 posts
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
    
  Scenario: popular posts
    Then I should see the popular posts title
    And I should see the 5 most popular post titles
    
  Scenario: right column related posts
    Then I should see the related posts title
    And I should see the 5 most popular related post titles
    
  Scenario: right column related posts
    Then I should see "Recent Comments"

   # Scenario: right column archives
   #   Then I should see "Archives"
   #   And I should see "2010"
   # 
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
   # Scenario: the blog post should have a footer
   #   Then I should see the generic footer