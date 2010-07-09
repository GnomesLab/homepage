Feature: blog with tags
  In order to allow our users to find related posts
  The blog posts should have tags
  So users can easely search for similar posts
  
  Scenario: Posts should have tags
    Given I am on the posts page
    And I have a post
    Then i should see tags