@crystal
Feature: edit user page

  Scenario: page should not be avaliable
      Given I am logged in
      When I visit the edit user page
      Then I should see "Not Found"