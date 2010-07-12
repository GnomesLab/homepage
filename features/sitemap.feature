Feature: sitemap
  As visitor of the gnomeslab website
  I need a map of all the pages
  So I can find what i want faster
  
  Background: Given I am on the sitemap page
  
  Scenario: the sitemap page should have a header
    Then I should see the generic header
    
  Scenario: the sitemap page should have a sitemap
    Then I should see the sitemap
  
  # TODO : figure out wich menus to put on the right column  
  Scenario: the sitemap page should have right menus