Feature: header and footer
  As a user
  I want nifty header and footers that are the same across all website
  So i can always click them if i get bored at what im reading
  
  Scenario: all pages should have a header with the top menus and logo with links
    Given I am on the homepage
    Then I should click the generic headers

  Scenario: the footer should have a resume of the about information
    Given I am on the homepage
    Then I should see about information
    
  Scenario: the footer should have a blogroll of the most recent blog titles
    Given I am on the homepage
    Then I should see the most recent blog titles
    
  Scenario: the footer should have a tag cloud
    Given I am on the homepage
    Then I should see the tag cloud
    
  Scenario: the footer should have gnomeslab latest tweets
    Given I am on the homepage
    Then I should see the latest tweets







# Since we're splitting these up, for performance reasons, I would make the See the generic footer and header tests only use READ ONLY assertions, and this file could test the actions itself, visiting all the links and checking if they are working as intended.
# 
# This way the about page tests, for example, will run much faster.