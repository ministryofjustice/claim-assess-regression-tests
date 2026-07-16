Feature: POA E2E journey

  @smoke @claim
  Scenario: The provider/User logs in and goes through E2E POA journey
    Given I log in to Claim as user "bob" with password "password"
    Then I should see the page title "Your Claims – Claim for controlled work – GOV.UK"
    Then I should see the heading "Your Claims"
    When I open the "poa profit cost details" page for claim "019f5c43-7d3b-7a50-8f2e-442533c936d0"
    Then I should see the heading "Profit cost details"
    Then I should see the following Elements
      | Elements                     |
      | Profit cost details          |
      | Court or judge type          |
      | What is your client’s party  |
      | Are you the first solicitor  |
      | Has there been a transfer of |
    Then I should see the following radio options for "Court or judge type"
      | County court      |
      | High court        |
      | Magistrates court |
      | Other judge       |
    Then I should see the following radio options for "What is your client’s party status?"
      | Child        |
      | Joined party |
      | Parent       |
    When I select "High court" radio button for "Court or judge type"
    When I select "Child" radio button for "What is your client’s party status?"
    When I select "Yes" radio button for "Are you the first solicitor firm acting on this case?"
    When I check "No" radio button for "Has there been a transfer of solicitor on this case?"
    When I click on "Save and continue" button
    Then I should see the following radio options for "How many clients did you have at the start of the case?"
      | 0 |
      | 1 |
      | 2 |
    When I select "1" radio button for "How many clients did you have at the start of the case"
    When I click on "Save and continue" button
    Then I should see the following radio options for "Have you attended at least one hearing where you have represented more than one client?"
      | Yes |
      | No  |
    When I select "Yes" radio button for "Have you attended at least one hearing where you have represented more than one client?"
    When I click on "Save and continue" button
    Then I should see the following radio options for "Do you wish to escape the standard fixed fee?"
      | Yes |
      | No  |
    When I select "Yes" radio button for "Do you wish to escape the standard fixed fee?"
    When I click on "Save and continue" button
    Then I should see the heading "POA CPGFS profit cost bill line"
    When I enter "24" in the "Day" field
    And I enter "12" in the "Month" field
    And I enter "2025" in the "Year" field
    And I enter "1000" in the "Actual net profit cost" field
    And I enter "1000" in the "Actual net advocacy costs" field
    When I select "Yes" radio button for "Does VAT apply?"
    And I enter "Test" in the "Fee earner name" field
    When I click on "Save and continue" button
    Then I should see the heading "Upload POA evidence"
    When I upload a file "testDocument2.pdf"
    Then I should see the uploaded file details for "testDocument2.pdf"
    When I click on "Save and continue" button
    Then I should see the heading "Check your details"
    Then I should see the following details on the "Check your details" page
      | Element                    |
      | Assessment summary         |
      | Check your answers         |
      | POA CPGFS profit cost bill |
      | Date 20 December 2023      |
      | Evidence                   |
      | Expert cost bill line      |
      | Submit                     |
    Then I click on "Submit" button
    Then I should see the heading "Payment on account submitted"
    When I click the guidance on processing timescales link
    Then I should see another page with the heading "Civil processing dates"
    Then I should see a link "Return to claim summary page"
    When I click sign out button

  @smoke @claim
  Scenario: POA - Expert cost journey E2E
    Given I log in to Claim as user "bob" with password "password"
    When I open the "poa expert cost details" page for claim "1"
    Then I should see the heading "Expert cost"
    When I enter "24" in the "Day" field
    And I enter "12" in the "Month" field
    And I enter "2025" in the "Year" field
    And I enter "1000" in the "Actual net value" field
    When I select "Yes" radio button for "Does VAT apply?"
    And I enter "Test" in the "Fee earner name" field
    And I enter "Test description" in the "Description" field
    When I click on "Save and continue" button
    Then I should see the heading "Upload POA evidence"
    When I upload a file "testDocument2.pdf"
    Then I should see the uploaded file details for "testDocument2.pdf"
    When I click on "Save and continue" button
    Then I should see the heading "Check your details"
    Then I should see the following details on the "Check your details" page
      | Element                    |
      | Assessment summary         |
      | Check your answers         |
      | Expert cost bill line      |
      | Date 20 December 2023      |
      | Evidence                   |
      | POA CPGFS profit cost bill |
      | Submit                     |
    Then I click on "Submit" button
    Then I should see the heading "Payment on account submitted"
    When I click the guidance on processing timescales link
    Then I should see another page with the heading "Civil processing dates"
    Then I should see a link "Return to claim summary page"
    Then I click sign out button
