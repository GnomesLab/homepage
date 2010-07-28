@pdc
Feature: login page
  In order to mantain the website
  We need a login page
  So that we can autheticate ourselves
  
  Background: 
    Given I am on the login page
    And I have an account
  
  Scenario: logging in an  account
    And I am not authenticated
    When I fill in "email" with "john@doe.com"
    And I fill in "password" with "12345"
    And I press "Login"
    Then I should see "Welcome, John"
  
  Scenario: invalid email
    And I am not authenticated
    When I fill in "email" with "zomghacker"
    And I fill in "password" with "12345"
    And I press "Login"
    Then I should see "You email or password sux ass"
    
  Scenario: invalid password
    And I am not authenticated
    When I fill in "email" with "john@doe.com"
    And I fill in "password" with "zomgiforgot"
    And I press "Login"
    Then I should see "You email or password sux ass"