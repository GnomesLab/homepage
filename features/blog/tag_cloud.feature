@wip
Feature: tag cloud
  As visitor of the gnomeslab website
  I want a tag cloud present
  So I can browse trough the content easely
  
  Background:
    Given There are 10 posts
    And I am on the posts page

  Scenario: the page should have a tag cloud
    Then I should see the tag cloud title
    And I should see the 3 first cloud tags