Feature: header and footer
  As a user
  I want headers and footers that are the same across all website
  So I can navigate freely
  
  Background:
    Given I am on the homepage
  
  # Scenario: all pages should have a header with the top menus and logo with links
  #   Then I should make sure they are all working by clicking them one by one
  
  Scenario: the rss feed link should be working
    When I follow the "RSS" link
    Then I should see rss related stuff
    
  Scenario: the facebook link should be working
    When I follow the "Facebook" link
    Then I should see facebook related stuff
    
  Scenario: the twitter link should be working
    When I follow the "Twitter" link
    Then I should see twitter related stuff
    
  Scenario: the header link for home should be working
    When I follow the "HOME" link
    Then I move to the homepage´
    
  Scenario: the header link for about should be working
    When I follow the "ABOUT" link
    Then I move to the about page
  
  Scenario: the header link for services should be working
    When I follow the "SERVICES" link
    Then I move to the services page
  
  Scenario: the header link for projects should be working
    When I follow the "PROJECTS" link
    Then I move to the projects page
  
  Scenario: the header link for blog should be working
    When I follow the "BLOG" link
    Then I move to the blog page
    
  Scenario: the header link for contact should be working
    When I follow the "CONTACT" link
    Then I move to the blog page

  Scenario: the footer should have a resume of the about information
    Then I should see about information
    
  Scenario: the footer should have a blogroll of the most recent blog titles
    Then I should see the most recent blog titles
    
  Scenario: the footer should have a tag cloud
    Then I should see the tag cloud
    
  Scenario: the footer should have gnomeslab latest tweets
    Then I should see the latest tweets







# Since we're splitting these up, for performance reasons, I would make the See the generic footer and header tests only use READ ONLY assertions, and this file could test the actions itself, visiting all the links and checking if they are working as intended.
# 
# This way the about page tests, for example, will run much faster.