Feature: Create Categories
  As a blog administrator
  In order to be able to categorize articles
  I want to be able to create categories in my blog

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully create category
    When I follow "Categories"
    And I create new "TestCategory1" category
    Then I should see "TestCategory1"
