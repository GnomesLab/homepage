@mt
Feature: comments on a post page
  As a visitor of gnomeslab website
  I should be able comment a post or a top level comment

  Background:
    Given There is 1 post
    And I am on the view post page

  Scenario: a post with no comments should display 0 comments
     And there are 0 comments
     Then I should see 0 comments
     And the comments list should contain 0 comments

  Scenario: the comment should have name, date, email, website and content
    And there are 5 comment
    And I am on the view post page
    Then I should see the comment name
    And I should see the comment date
    And I should see the comment body
    And I should see the comment number
    And I should see the comment name as a link to the url

  Scenario: a comment may have no website
    And there are 1 comment
    And the comment has no url
    And I am on the view post page
    Then I shouldn't see the comment name as a link to the url

  Scenario: add comment form
    Then I should see a text area for name
    And I should see a text area for email
    And I should see a text area for website
    And I should see a text area for content
    And I should have a "submit comment" button

  Scenario: successfully created comment
    And I have valid data for a comment form
    And I press "Submit"
    Then I should see "Successfully created a comment"
    And comment count should up by one
    And I should see the comment created

  Scenario: invalid comment form
    And I fill the comment form using an invalid name
    And I press "Submit"
    Then I should see "You need to provide a valid name"

  Scenario: admin should be able to hide comments
    And I am signed in
    Then I should see the 'Hide' button

  Scenario: admin should be able to show comments
    And I am signed in
    And There is a hidden comment
    Then I should see the 'Show' button

  Scenario: visitor shouldn't see the visibility button
    And I am not signed in
    Then I shouldn't see any visibility button

  Scenario: invisible comments aren't displayed
    And I am not signed in
    And I have 1 invisible comment
    Then I should not see invisible comments

  Scenario: can reply to top level comments
    And I have a top level comment
    Then I should see the "Reply" button

  Scenario: can't reply to child comments
    And I have a child comment
    Then I shouldn't see the "Reply" button  