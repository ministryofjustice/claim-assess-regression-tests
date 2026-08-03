Feature: Claim for Payment - Login and happy path journey

  @smoke @claim
  Scenario: The provider/User logs in and land on Claims home page
    Given I log in as user "bob" with password "password"
    Then I should see the page title "Your Claims – Claim for controlled work – GOV.UK"
    Then I should see the heading "Your Claims"
    Then I should see the following Elements
      | Elements              |
      | Submitted In progress |
      | Your claims           |
      | Your submissions      |
      | Import claim          |
      | Sign out              |
    When I click on "LAA-001" link
    Then I should see the heading "TODO"
    When I click on "Return to claims" link
    Then I should see the heading "Your Claims"
    When I click sign out button

  @smoke @claim
  Scenario: The provider/User logs in and can land on upload evidence page
    Given I log in as user "bob" with password "password"
    Then I should see the page title "Your Claims – Claim for controlled work – GOV.UK"
    Then I should see the heading "Your Claims"
    Then I should see the following Elements
      | Elements              |
      | Submitted In progress |
      | Your claims           |
      | Your submissions      |
      | Import claim          |
      | Sign out              |
    When I click on "Create a new claim" button
    When I click sign out button

  @smoke @claim
  Scenario: The provider/User logs in and chooses how to upload evidence page
    Given I log in as user "bob" with password "password"
    Then I should see the page title "Your Claims – Claim for controlled work – GOV.UK"
    Then I should see the heading "Your Claims"
    Then I should see the following Elements
      | Elements              |
      | Submitted In progress |
      | Your claims           |
      | Your submissions      |
      | Import claim          |
      | Sign out              |
    When I click on "Create a new claim" button
    Then I should see the heading on the page "How do you want to upload your evidence?"
    When I click on "Associated to specific line" radio button
    When I click on "Save and continue" button
    When I click on "Interim hearing on 20 December 2023" link
    When I upload a file "testDocument.pdf"
    When I click on "Save and continue" link
    Then I should see a "Uploaded" tag next to "Interim hearing on 20 December 2023"
    When I click on "Interim hearing on 4 January 2024" link
    When I reuse a file "testDocument.pdf"
    And I click on "Save and continue" button
    Then I should see a "Uploaded" tag next to "Interim hearing on 4 January 2024"
    When I click sign out button