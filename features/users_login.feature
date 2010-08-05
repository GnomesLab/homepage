@wip @pdc
Feature: login page
  In order to mantain the website
  We need a login page
  So that we can autheticate ourselves
  
  Background: 
    Given I am on the login page
    And I have an account

  Scenario: logging in an account
    And I am not authenticated
    When I fill in "Email" with "john1@doe.com"
    And I fill in "Password" with "123456"
    And I press "Sign in"
    Then I should see "Signed in successfully."
  
  Scenario: invalid email
    And I am not authenticated
    When I fill in "Email" with "bademail@nomail.com"
    And I fill in "Password" with "secret"
    And I press "Sign in"
    Then I should see "Invalid email or password."
    
  Scenario: invalid password
    And I am not authenticated
    When I fill in "Email" with "john1@doe.com"
    And I fill in "Password" with "badpassword"
    And I press "Sign in"
    Then I should see "Invalid email or password."