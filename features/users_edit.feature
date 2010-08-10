@crystal
Feature: edit user page

  Scenario: page should not be avaliable
      Given I am signed in
      When I am on the profile page
      Then I should see "Not Found"