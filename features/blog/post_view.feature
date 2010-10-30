@crystal
Feature: view post
  In order to allow our visitors to read a post with more detail
  Gnomeslab website provides them with a post view page.
  Within this page, the visitor can not only view the whole post, but also its comments.
  Furthermore, we allow our visitors to engage with the content through the use of the new comment feature.
  
  Background:
    Given There are 5 post
    And There are unpublished posts
    And I am on the view post page

  Scenario: page header
    Then I should see the generic header
    And I should see "Blog" selected in the header

  Scenario: redirect to friendly url
    Then I should be on the friendly url post page

  Scenario: blog post
    Given I am signed in
    When I am on the posts page
    Then I should see the post title
    And I should see the post date
    And I should see the post body
    And I should see the post creator name
    And I should see the post tags
    And I should see the post comment count
    And I should see the post delete link
    And I should see the post edit link

  Scenario: delete or update
    Given I am not signed in
    When I am on the posts page
    Then I should not see the post edit link
    And I should not see the post delete link
    
  Scenario: right column related posts
    Then I should see the related posts title
    And I should see the 5 most popular related post titles
      
  Scenario: right column popular posts
    Then I should see the popular posts title
    And I should see the 5 most popular post titles

  Scenario: right column recent comments
    Then I should see "Recent Comments"

  Scenario: not see unpublished posts
    Given I am not signed in
    And I am on the posts page
    Then I should be on the blog page

  Scenario: see unpublished posts
    Given I am signed in
    And I am on the posts page
    Then I should see unpublished posts

  Scenario: edit post
    Given I am signed in
    When I am on the posts page
    Then I follow "Edit"

  Scenario: destroy post
    Given I am signed in
    When I am on the posts page
    Then I follow "Destroy"
    # FIXME: it wasn't possible to catch the confirmation box

  Scenario: page footer
    Then I should see the generic footer