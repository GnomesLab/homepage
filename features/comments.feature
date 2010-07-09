@wip
Feature: blog page with comments
  In order to let the community know what we are up to
  The blog page should provide a way for the staff to create blog posts
  And provide a way for everyone to comment on those posts
  And provide a way to manage those comments
  
  Scenario: I should be able to create comments
    Given I am on the blog page
    And I have a post
    Then I should be see "comment"