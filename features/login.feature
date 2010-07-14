Feature: logins page
  As an admin
  I order to create blog posts and moderate the comments
  I need a login page so i can authenticate myself

  Background: 
    Given I am on the login page

  Scenario: the login page should have a header
    Then I should see the generic header

  Scenario: the login page should have a login form
    When I insert my credentials
    And I press login
    Then I should be logged in
    And I should be redirected to the homepage

  Scenario: the login page should have a logout button
    When I am done with my business
    Then I should press "Logout"
    And I should have my session terminated 
    And I should be redirected to the homepage

  Scenario: username validation for login form
    And I have an invalid username
    And I fill the comment form
    And I press "Submit"
    Then I should see "You need to provide a valid username or password"

  Scenario: password validation for login form
    And I have an invalid password
    And I fill the comment form
    And I press "Submit"
    Then I should see "You need to provide a valid username or password"
    
  Scenario: a cookie should be given after sucessful login
    When I log in
    Then I should receive a cookie
    

  Scenario: the blog post should have a footer
    Then I should see the generic footer