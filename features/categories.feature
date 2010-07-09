Feature: blog posts with categories
  In order for the posts to be easely browsed
  The blog posts should should have categories
  And the blog page should have links to the categories
  So users can efficiently browse our posts trough them
  
  Scenario: As a user i should be able to see categories
    Given I am on the posts page
    And I have a post
    Then I should see categories
    