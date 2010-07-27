Feature: services page
  As a user
  I want a services page
  So I can know exactly for what kind of services i can hire from gnomeslab

  Background: 
    Given I am on the services page

  Scenario: the services page should have a header
    Then I should see the generic header

  Scenario: right column with links to our featured project
    Then I should see "Featured Project"
    And I should see "Lorem ipsum"
    
  Scenario: right column with a contact teaser
    Then I should see "Services Contact Teaser"
    And I should see "Some contact teaser"
    
  Scenario: there should be a websites service
    Then I should see "Websites"
    And I should see "Your website might be everything"
    
  Scenario: there should be a websites service
    Then I should see "Web Applications"
    And I should see "With internet speeds and stability"
    
  Scenario: there should be a web services service
    Then I should see "Web Services"
    And I should see "Lorem ipsum"
  
  Scenario: the blog post should have a footer
    Then I should see the generic footer