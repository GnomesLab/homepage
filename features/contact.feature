@wip
Feature: contact page
  In order to allow Gnomeslab Homepage visitors to contact our company
  We provide them with a contact form that forwards their messages to our mailbox
  It also stores all the contents in the database for statistical analysis

  Background:
    Given I am on the contact page

  Scenario: page header
    Then I should see the generic header

  Scenario: page title and pitch line
    Then I should see "Feedback"
    And I should see "Send us a message! We would love to hear about your projects... or could just say hi!"

  Scenario: right column gnomeslab profile
    Then I should see "Our profile"
    And I should see "Friendly and very approachable"
    And I should see "Standards and User Experience"
    And I should see "Agile Development practitioners"
    And I should see "We use Ruby on Rails and other agile tools"
    And I should see "We respond to you, not investors"

  Scenario: the contact page should have a functional contact form
    When I fill in "First Name" with "John"
    And I fill in "Last Name" with "Doe"
    And I fill in "Email" with "email@somehost.com"
    And I fill in "Company" with "ESA"
    And I fill in "Message" with "There is no spoon"
    And I click "Send the Message"
    Then I should see "Thank you! Your message was sent"

  Scenario: the contact form should be provided with a valid first name
    And I have a invalid first name
    When I fill in the contact form
    And I press "Send the Message"
    Then I should see "Error! Please enter your first name!"

  Scenario: the contact form should be provided with a valid last name
    And I have a invalid last name
    When I fill the contact form
    And I press "Send the Message"
    Then I should see "Error! Please enter your last name!"

  Scenario: the contact form should be provided with a valid email
    And I have a invalid email
    When I fill the contact form
    And I press "Send the Message"
    Then I should see "Error! Please enter your valid email!"

  Scenario: the contact form should be provided with a valid message
    And I have a invalid message
    When I fill the contact form
    And I press "Send the Message"
    Then I should see "Error! Please enter your message!"

  Scenario: the blog post should have a footer
    Then I should see the generic footer