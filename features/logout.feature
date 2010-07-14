Feature: logout page
  As an admin
  I require a logout page to end my session
  And as a user
  I should be redirected out of the logout page
  If i try to access it
  And not causing any harm to the website

  Scenario:
    Given I am not logged in
    When I visit the logout page
    Then I should be redirected to the homepage
    And I should not see an error message
    And I should not see a success message