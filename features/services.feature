@crystal
Feature: services page
  As a user
  I want a services page
  So I can know exactly for what kind of services i can hire from gnomeslab

  Background: 
    Given I am on the services page

  Scenario: page header
    Then I should see the generic header

  Scenario: right column featured project
    Then I should see "Featured Project"
    And I should see "Lorem ipsum"

  Scenario: right column contact teaser
    Then I should see "Have a project?"
    And I should see "Some contact teaser"

  Scenario: web development service
    Then I should see "Web development"
    
  Scenario: product development service
    Then I should see "Product development"
    
  Scenario: consulting service
    Then I should see "Consulting"

  Scenario: page footer
    Then I should see the generic footer