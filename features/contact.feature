Feature: contact page
  As a user
  I want a contact form avaliable
  So I can contact gnomeslab directly
  
  Background:
    Given I am on the contact page
  
  Scenario: the contact page should have a header
    Then I should see the generic header
  
  Scenario: right column contact us teaser content
    Then I should see "Teaser content"
  
  # TODO: replace with existing factory_girl
  Scenario: the contact page should have a functional contact form
    When I fill in "First Name" with "John"
    And I fill in "Last Name" with "Doe"
    And I fill in "Email" with "email@somehost.com"
    And I fill in "Company" with "NASA"
    And I fill in "Message" with "There is no spoon"
    And I click "Send the Message"
    Then I should see "Thank you! Your message was sent"
    
  Scenario: the contact form should be provided with a valid first name
    And I have a invalid first name
    When I fill in the contact form
    And I press "Send the Message"
    Then I should see "Error! Please enter your first name!"
  
  Scenario: the contact form should be provided with a valid
    And I have a invalid last name
    When I fill the contact form
    And I press "Send the Message"
    Then I should see "Error! Please enter your last name!"
      
  Scenario: the contact form should be provided with a valid
    And I have a invalid email
    When I fill the contact form
    And I press "Send the Message"
    Then I should see "Error! Please enter your valid email!"
        
  Scenario: the contact form should be provided with a valid
    And I have a invalid message
    When I fill the contact form
    And I press "Send the Message"
    Then I should see "Error! Please enter your message!"
    
  Scenario: the blog post should have a footer
    Then I should see the generic footer
  