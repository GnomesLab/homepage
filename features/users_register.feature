@crystal
Feature: register page

  Scenario: page should not be avaliable
      Given I am not authenticated
      When I visit the register page
      Then I should see "Not Found"