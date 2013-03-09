Feature: Merge Articles
  As a blog administrator
  In order to compose the work of two authors
  I want to be able to merge articles in my blog

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    And I created "Merge1" article with "OLOLO1" content
    And I created "Merge2" article with "LOLOLO2" content

  Scenario: Successfully merge articles
    Given I am on the "Merge1" article edit page
    When I fill in merge field with "Merge2" article id
    And I press "Merge"
    Then I should see the content of both "OLOLO1" and "LOLOLO2" 
