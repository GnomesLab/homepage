@crystal
Feature: comments on a post page
  As a visitor of gnomeslab website
  I should be able to comment a post
  And I should be able to reply to other comments

  Background:
    Given There is 1 post
    And there are 5 comment
    And I am not signed in
    And I am on the view post page

  Scenario: a post with no comments should display 0 comments
    And there are 0 comments
    And I am on the view post page
    Then I should see 0 comments
    And the comments list should contain 0 comments

  Scenario: a post with 1 comment should display 1 comment
    And there are 1 comment
    And I am on the view post page
    Then I should see 1 comment
    And the comments list should contain 1 comment

  Scenario: a post with 2 comments where 1 is hidden should display 1 comment
    And there are 2 comments
    And There is a hidden comment
    And I am on the view post page
    Then I should see 1 comments
    And the comments list should contain 1 comments

  Scenario: the comment should have name, date, email, website and content
    Then I should see the comment name
    And I should see the comment date
    And I should see the comment body
    And I should see the comment number
    And I should see the comment name as a link to the url

  Scenario: comment url
    When I click on a comment url it should open a new window

  Scenario: a comment may have no website
    And there are 1 comment
    And the comment has no url
    And I am on the view post page
    Then I shouldn't see the comment name as a link to the url

  Scenario: I should be able to comment a post
    And I fill in "Name" with "name"
    And I fill in "Email" with "email@email.com"
    And I fill in "URL" with "www.website.com"
    And I fill in "Comment" with "This is a comment"
    When I press "Submit your comment"
    Then I should see "Comment was successfully created."

  Scenario: Invalid comment
    When I press "Submit your comment"
    Then I should see "Oops! Your comment could not be created."

  Scenario: admin should be able to show comments
    And I am signed in
    And There is a hidden comment
    And I am on the view post page
    When I follow "Show"
    Then I should see "Hide"

  Scenario: visitor shouldn't see the visibility button
    Then I should not see "Hide"

  Scenario: invisible comments aren't displayed
    And There is a hidden comment
    And I am on the view post page
    Then I should not see the hidden comment
