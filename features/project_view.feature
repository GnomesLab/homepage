@wp @mt
Feature: projects page
  As website visitor if i got impressed by a project
  I would like to see the project details

  Background:
    Given Gnomeslab has 1 project
    And Im on the project page

  Scenario: page header
    Then I should see the generic header

  Scenario: breadcrumb
    Then I should see the breadcrumb
    And the breadcrumb should contain a link to the projects page
    And the breadcrumb should contain a link to the current category
    And the breadcrumb should contain a link to the current project

  Scenario: image rotator should be visible if the project has more than 1 image
    Given the project has more than 1 image
    Then I should see the project rotator

  Scenario: image rotator should work if the project has more than 1 image
    Given the project has more than 1 image
    When I click on the project rotator
    Then I should another image of the project

  Scenario: image rotator shouldn't be visible if the project has less than 1 image
    Given the project has less than 2 images
    Then I shouldn't see the image rotator

  Scenario: the project image should be visible if the project has only 1 image
    Given the project has less than 2 images
    Then I should see the project image

  Scenario: the project image shouldn't be visible if the project has no image
    Given the project has less than 1 image
    Then I shouldn't see the project image

  Scenario: project title
    Then I should see the project title

  Scenario: project category
    Then I should see the project category

  Scenario: project date
    Then I should see the project long date

  Scenario: project description
    Then I should see the project description
  
  Scenario: right column project categories
    Then I should see a link to the project category

  Scenario: right column contact teaser
    Then I should see the contact teaser
    And I should see "contact us"
    And I should see the contact link

  Scenario: page footer
   Then I should see the generic footer