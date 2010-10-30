@crystal
Feature: services page
  In order to allow our visitors to know which services Gnomeslab offers to the market
  We provide a service portfolio page, detailing our three major offerings
  Furthermore, we take this opportunity to provide our visitors with quick overview of one of our featured projects
  as well as quick access to our contacts.

  Background: 
    Given I am on the services page

  Scenario: page header
    Then I should see the generic header
    And I should see "Services" selected in the header

  Scenario: web development service
    Then I should see "Web development"
    And I should see "The Internet is becoming more"
    
  Scenario: product development service
    Then I should see "Product development"
    And I should see "So you have an idea for a new product?"
    
  Scenario: consulting service
    Then I should see "Consulting"
    And I should see "Somethings companies run into issues that go way beyond the technical scope."

  Scenario: right column company profile
    Then I should see "Our profile"

  Scenario: right column contact teaser
    Then I should see "Have an idea a project or a problem?"
    And I should see "We can help you with that!"

  Scenario: page footer
    Then I should see the generic footer
