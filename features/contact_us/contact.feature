@crystal
Feature: contact page
  In order to allow Gnomeslab Homepage visitors to contact our company
  We provide them with a contact form that forwards their messages to our mailbox
  It also stores all the contents in the database for statistical analysis

  Background:
    Given I am on the contact page

  Scenario: page header
    Then I should see the generic header
    And I should see "Contact" selected in the header

  Scenario: page title and pitch line
    Then I should see "Contact Gnomeslab"
    And I should see "Send us a message! We would love to hear about your projects... or could just say hi!"

  Scenario: right column gnomeslab profile
    Then I should see "Our profile"
    And I should see "Friendly and very approachable"
    And I should see "Standards and User Experience"
    And I should see "Agile Development practitioners"
    And I should see "We use Ruby on Rails and other agile tools"
    And I should see "We respond to you, not investors"

  Scenario: visible contact form
    Then I should see "Your name (required)"
    And I should see "Email (required) we will keep it safe"
    And I should see "Company name (optional)"
    And I should see "Phone number (optional)"
    And I should see "Your message (required)"

  Scenario: cannot send a message without a name
    Given I fill in "name" with ""
    When I press "Send your message"
    Then I should see a generic contact error message
  
  Scenario: cannot send a message without a valid email address
    Given I fill in "enquiry[email]" with "invalid@mail"
    When I press "Send your message"
    Then I should see a generic contact error message

  Scenario: cannot send a message without filling in its body
    Given I fill in "message" with ""
    When I press "Send your message"
    Then I should see a generic contact error message
    
  Scenario: messages can be sent without a company name or a phone number
    Given I have contact without company name or phone number
    And I fill in the contact form
    When I press "Send your message"
    Then I should see a contact message successfully sent flash
    And An email should be sent to Gnomeslab

  Scenario: messages can be sent when all fields are filled in
    Given I have valid contact data
    And I fill in the contact form
    When I press "Send your message"
    Then I should see a contact message successfully sent flash
    And An email should be sent to Gnomeslab

  Scenario: page footer
    Then I should see the generic footer