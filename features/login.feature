Feature: login page
  As an admin
  I order to create blog posts and moderate the comments
  I need a login page so i can authenticate myself

  Background: 
    Given I am on the login page

  Scenario: the login page should have a header
    Then I should see the generic header

  Scenario: the login page should have a working login form
    When I insert my credentials
    And I press login
    Then I should be logged in
    And I should receive a cookie
    And I should be redirected to the homepage
    And I should see successfully logged in

  Scenario: the login page should have a logout button
    And I am already logged in
    When I should press "Logout"
    Then my session should be terminated
    And my cookies should be cleared
    And I should be redirected to the homepage
    And I should see successfully logged out

  Scenario: username validation for login form
    And I have an invalid username
    And I fill the comment form
    And I press "Submit"
    Then I should see "Invalid username or password"

  Scenario: password validation for login form
    And I have an invalid password
    And I fill the comment form
    And I press "Submit"
    Then I should see "Invalid username or password"

  Scenario: the blog post should have a footer
    Then I should see the generic footer