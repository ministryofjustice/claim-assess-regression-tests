Feature: Assess - Login and Claims Home Page

  @smoke @assess 
  Scenario: The caseworker logs in and land on their home page
    # Given I am on the Claim for Payment home page
    Given I am on the Assess home page
    Then I should see the page title "Assess Claim for Civil Work – GOV.UK"
    Then I should see the heading "Your Assessments"
#     Then I should see the page heading "Start your claim for payment"
#     Then I should see the following Elements
#       | Elements              |
#       | Submitted In progress |
#       | Your claims           |
#       | Your submissions      |
#       | Import claim          |
#       | Sign out              |
When I click on "LAA-001" link
Then I should see the heading "LAA-" 
And I should see the heading "Assess a claim" 
When I click on "Return to claims" link
When I click sign out button
Given I am on the Assess home page