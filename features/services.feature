Feature: services page
  As a user
  I want a services page
  So I can know exactly for what kind of services i can hire from gnomeslab

  Background: Given I am on the services page

  Scenario: the services page should have a header
    Then I should see the generic header

  Scenario: right column with links to our services details
    Then I should see "Our Services"
    And I should see "Service 1"
    And I should see "Service 2"
    And I should see "Service 3"

  Scenario: the services page should have a small text stating how proud we are of our work
    Then I should see a motivational speech emphacising GL outstanding work
  
  Scenario: the services page should have a overview of each service we provide
    When I follow "Service 1"
    Then I should see "Service 1 details
"
  # Scenario: each service should have a service name - gief names?
  
  Scenario: each service should have a resumed text describing its content
    Then I should see "small description"
    
  Scenario: each service should have a link to read more
    Then I should see "read more" link
  
  Scenario: the blog post should have a footer
    Then I should see the generic footer