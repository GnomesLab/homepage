# Feature: header and footer
#   As a user
#   I want nifty header and footers that are the same across all website
#   So i can always click them if i get bored at what im reading
#   
#   Scenario: header should have the logo as a link to "home"
#   Scenario: header should have the top menus
#   
#   Scenario: the top menus should have a link to "HOME"
#   Scenario: the top menus should have a link to "ABOUT"
#   Scenario: the top menus should have a link to "SERVICES" with a pulldown menu with a link to each service
#   Scenario: the top menu should have a link to "PROJECTS" with a pulldown menu with a link to each project
#   Scenario: the top menu should have a link to "BLOG"
#   Scenario: the top menu should have a link to "CONTACT"
#   
#   Scenario: the footer should have a resume of the about information
#   Scenario: the footer should have a blogroll of the most recent blog titles
#   Scenario: the footer should have a tag cloud
#   Scenario: the footer should have gnomeslab latest tweets







# Since we're splitting these up, for performance reasons, I would make the See the generic footer and header tests only use READ ONLY assertions, and this file could test the actions itself, visiting all the links and checking if they are working as intended.
# 
# This way the about page tests, for example, will run much faster.