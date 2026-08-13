Feature: Draft Claim - The provider/User sees their answers on the draft claim page

  @smoke @claim
  Scenario: The provider/User sees their draft claim
    Given I log in as user "bob" with password "password"
    Then I should see the page title "Your Claims – Claim for controlled work – GOV.UK"
    Then I should see the heading "Your Claims"
    When I click on "Payment on account" button
    Then I should see the heading "What type of POA are you claiming?"
    When I select "Profit cost" radio button for "What type of POA are you claiming?"
    When I click on "Save and continue" button
    When I click on "Back" link
    Then I should see "Profit cost" selected for "What type of POA are you claiming?"
    When I click on "Save and continue" button
    When I select "High court" radio button for "Court or judge type"
    When I select "Child" radio button for "What is your client’s party status?"
    When I select "Yes" radio button for "Are you the first solicitor firm acting on this case?"
    When I check "No" radio button for "Has there been a transfer of solicitor on this case?"
    When I click on "Save and continue" button
    When I click on "Back" link
    Then I should see "High court" selected for "Court or judge type"
    And I should see "Child" selected for "What is your client’s party status?"
    And I should see "Yes" selected for "Are you the first solicitor firm acting on this case?"
    And I should see "No" selected for "Has there been a transfer of solicitor on this case?"
    When I click on "Save and continue" button
    When I select "1" radio button for "How many clients did you have at the start of the case"
    When I click on "Save and continue" button
    When I click on "Back" link
    Then I should see "1" selected for "How many clients did you have at the start of the case"
    When I click on "Save and continue" button
    When I select "Yes" radio button for "Have you attended at least one hearing where you have represented more than one client?"
    When I click on "Save and continue" button
    When I click on "Back" link
    Then I should see "Yes" selected for "Have you attended at least one hearing where you have represented more than one client?"
    When I click on "Save and continue" button
    When I select "Yes" radio button for "Do you wish to escape the standard fixed fee?"
    When I click on "Save and continue" button
    When I click on "Back" link
    Then I should see "Yes" selected for "Do you wish to escape the standard fixed fee?"
    When I click on "Save and continue" button
    When I enter "24" in the "Day" field
    And I enter "12" in the "Month" field
    And I enter "2025" in the "Year" field
    And I enter "1000" in the "Actual net profit cost" field
    And I enter "1000" in the "Actual net advocacy costs" field
    When I select "Yes" radio button for "Does VAT apply?"
    And I enter "Test" in the "Fee earner name" field
    When I click on "Save and continue" button
    When I navigate back to the previous page
    Then I should see "24" in the "Day" field
    And I should see "12" in the "Month" field
    And I should see "2025" in the "Year" field
    Then I should see "1000" in the "Actual net profit cost" field
    Then I should see "1000" in the "Actual net advocacy costs" field
    Then I should see "Yes" selected for "Does VAT apply?"
    Then I should see "Test" in the "Fee earner name" field
    When I click sign out button
