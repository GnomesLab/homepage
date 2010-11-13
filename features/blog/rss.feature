@mt
Feature: blog page
  Gnomeslab wishes to keep its visitors updated using rss

  Background:
    Given There are 10 posts
    And There are unpublished posts
    And I am on the posts page via rss

  Scenario: rss headers
    Then I should see a xml document
    And I should see the rss version
    And I should see the channel headers

  Scenario: published posts
    Then I should see the published posts through rss items

  Scenario: can't see unpublished posts
    Then I should not see the unpublished posts through rss items