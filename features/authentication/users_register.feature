@crystal
Feature: register page

  Scenario: page should not be avaliable
      Given I am not signed in
      When I am on the registration page
      Then I should see "Not Found"