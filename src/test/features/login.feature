Feature: Claim for Payment - Login and happy path journey

  @claim
  Scenario: The User logs in and land on claims home page
    Given I am on the Claim for Payment home page
    Then I should see the heading "Your service name – GOV.UK"
#     When I enter valid credentials
#     When I click the Sign In button
    Then I should see the page title "My Claims"
#     Then I should see the page heading "Start your claim for payment"
#     Then I should see the following Elements
#       | Elements              |
#       | Submitted In progress |
#       | Your claims           |
#       | Your submissions      |
#       | Import claim          |
#       | Sign out              |
# When I click on "LAA-001" link
# Then I should see the heading "LAA-" 
# When I click on "Return to claims" link
# When I click sign out button
# Then I am on the Claim for Payment home page




