Feature: Create Categories
  As a blog administrator
  In order to be able to categorize articles
  I want to be able to create categories in my blog

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    When I follow "Categories"

  Scenario: Successfully create category
    When I create new "TestCategory1" category
    Then I should see "TestCategory1"

  Scenario: Successfully edit category
    When I create new "TestCategory2" category
    And I follow "TestCategory2"
    And change category description to "Changed description !!!"
    Then I should see "Changed description !!!"
