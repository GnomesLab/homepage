Feature: service details page
  As a user
  I want a service details page
  So I can learn more about a specific detail

  Background: 
    Given I am on the service details page

  Scenario: the service details page should have a header
    Then I should see the generic header

  Scenario: right column with links to our services details
    Then I should see "Our Services"
    And I should see "Service 1"
    And I should see "Service 2"
    And I should see "Service 3"

  Scenario: the service details page should have a small text stating how proud we are of our work
    Then I should see a motivational speech emphacising GL outstanding work
  
  Scenario: the service details page should have detailed information about a service
    Then I should see "Service 1 title"
    Then I should see "Service 1 details"
  
  Scenario: the blog post should have a footer
    Then I should see the generic footer