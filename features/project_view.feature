@crystal
Feature: projects page
  As website visitor if i got impressed by a project
  I would like to see the project details

  Background:
    Given Gnomeslab has 1 project
    And the project has 3 images
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
    And I should see the rotator next button
    And I should see the rotator previous button
    And the rotator should contain all the project previews

  Scenario: image rotator shouldn't be visible if the project has no image
    Given the project has less than 1 image
    And Im on the project page
    Then I shouldn't see the project rotator

  Scenario: project title
    Then I should see the project title

  Scenario: project date
    Then I should see the project long date

  Scenario: project description
    Then I should see the project description

  Scenario: project site link
    Then I should see the project site link

  Scenario: right column project categories
    Then I should see the categories list
    And I should see links to all the projects categories

  Scenario: right column contact teaser
    Then I should see the contact teaser
    And I should see "contact us"
    And I should see the contact link

  Scenario: page footer
   Then I should see the generic footer