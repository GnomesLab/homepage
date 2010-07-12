Feature: contact page
  As a user
  I want a contact form avaliable
  So I can contact gnomeslab directly
  
  Scenario: the contact page should have a header
    Then I should see the generic header
  
  Scenario: right column contact teaser content
    Then I should see "Teaser content"
  
  Scenario: the contact page should have a functional contact form
    Given I am on the contact page
    When I fill in "First Name" with "John"
    And I fill in "Last Name" with "Doe"
    And I fill in "Email" with "email@somehost.com"
    And I fill in "Company" with "NASA"
    And I fill in "Message" with "There is no spoon"
    And I click "Send the Message"
    Then I should see "Thank you! Your message was sent"
    
  Scenario: the blog post should have a footer
    Then I should see the generic footer
  