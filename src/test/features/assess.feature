Feature: Assess - Login and Claims Home Page

  @smoke @assess
  Scenario: The caseworker logs in and land on Assess home page
    Given I log in to Assess as user "alice" with password "password"
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
    When I click on "LAA-012" link
    Then I should see the heading "Fixed fee: Special Children Act (Care)"
    When I click on "Return to claims" link
    Then I should see the heading "Your Assessments"
    When I click sign out button
