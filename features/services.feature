Feature: services page
  As a user
  I want a services page
  So I can know exactly for what kind of services i can hire from gnomeslab

  Background: 
    Given I am on the services page

  Scenario: the services page should have a header
    Then I should see the generic header

  Scenario: right column with links to our services details
    Then I should see "Our Services"
    And I should see "Service 1"
    And I should see "Service 2"
    And I should see "Service 3"
    
  Scenario: there should be a websites service
    Then I should see "Websites"
    And I should see "Your website might be everything"
    
  Scenario: there should be a websites service
    Then I should see "Web Applications"
    And I should see "With internet speeds and stability"
    
  Scenario: there should be a web services service
    Then I should see "Web Services"
    And I should see "Lorem Ipsum"
  
  Scenario: the services page should have a overview of each service we provide
    When I follow "Service 1"
    Then I should see "Service 1 details"
    
  Scenario: each service should have a link to read more
    Then I should see "read more" link
  
  Scenario: the blog post should have a footer
    Then I should see the generic footer