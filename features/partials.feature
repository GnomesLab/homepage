Feature: all website should have the same header and footer
  In order to keep the same visual across all the website
  The header and the footer partials should always be present
  So that our contents are always avaliable within all pages
  
  Scenario: Header and Footer should always be present
    Given I am on a page
    Then I should see "header"
    And I should see "footer"