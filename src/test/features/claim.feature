Feature: Claim for Payment - Login and happy path journey

  @smoke @claim
  Scenario: The User logs in and land on claims home page
    Given I log in to Claim as user "bob" with password "password"
    Then I should see the page title "Claim for Controlled Work – GOV.UK"
    Then I should see the heading "Your Claims"
#     When I enter valid credentials
#     When I click the Sign In button
    # Then I should see the page title "My Claims"
#     Then I should see the page heading "Start your claim for payment"
    # Then I should see the following Elements
    #   | Elements              |
    #   | Submitted In progress |
    #   | Your claims           |
    #   | Your submissions      |
    #   | Import claim          |
    #   | Sign out              |
    When I click on "LAA-001" link
    Then I should see the heading "LAA-001"
    When I click on "Return to claims" link
    Then I should see the heading "Your Claims"
    When I click sign out button
