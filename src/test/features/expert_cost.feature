Feature: POA Expert cost scenarios

  @smoke @claim
  Scenario: POA - Expert cost journey E2E
    Given I log in as user "bob" with password "password"
    When I click on "Payment on account" button
    When I select "Expert cost" radio button for "What type of POA are you claiming?"
    When I click on "Save and continue" button
    Then I should see the heading "Expert cost"
    When I enter "26" in the "Day" field
    And I enter "03" in the "Month" field
    And I enter "2026" in the "Year" field
    And I enter "19" in the "Actual net value" field
    When I select "Yes" radio button for "Does VAT apply?"
    And I enter "Test" in the "Fee earner name" field
    And I enter "Test description" in the "Description" field
    When I click on "Save and continue" button
    Then I should see the heading "You have added an expert cost"
    When I select "Yes" radio button for "Do you need to add another expert cost?"
    When I click on "Save and continue" button
    Then I should see the heading "Expert cost"
    When I enter "26" in the "Day" field
    And I enter "02" in the "Month" field
    And I enter "2026" in the "Year" field
    And I enter "100" in the "Actual net value" field
    When I select "Yes" radio button for "Does VAT apply?"
    And I enter "Test" in the "Fee earner name" field
    And I enter "Test description" in the "Description" field
    When I click on "Save and continue" button
    Then I should see the heading "You have added 2 expert costs"
    When I click on the "Remove" link for "26 March 2026"
    Then I should see the heading "Are you sure you want to remove this expert cost?"
    Then I select "Yes" radio button for "Are you sure you want to remove this expert cost?"
    When I click on "Save and continue" button
    Then I should see the heading "You have added an expert cost"
    When I select "No" radio button for "Do you need to add another expert cost?"
    When I click on "Save and continue" button
    Then I should see the heading "Upload POA evidence"
    When I upload a file "testDocument2.pdf"
    When I click on "Save and continue" button
    Then I should see the heading "Check your details"
    Then I click on "Submit" button
    Then I should see the heading "Payment on account submitted"
    When I click the guidance on processing timescales link
    Then I should see another page with the heading "Civil processing dates"
    Then I should see a link "Return to claim summary page"
    Then I click sign out button

  @smoke @claim
  Scenario: Changing POA cost type from expert cost to profit cost
    Given I log in as user "bob" with password "password"
    When I click on "Payment on account" button
    When I select "Expert cost" radio button for "What type of POA are you claiming?"
    When I click on "Save and continue" button
    Then I should see the heading "Expert cost"
    When I enter "26" in the "Day" field
    And I enter "03" in the "Month" field
    And I enter "2026" in the "Year" field
    And I enter "20" in the "Actual net value" field
    When I select "Yes" radio button for "Does VAT apply?"
    And I enter "Test" in the "Fee earner name" field
    And I enter "Test description" in the "Description" field
    When I click on "Save and continue" button
    Then I should see the heading "You have added an expert cost"
    When I select "No" radio button for "Do you need to add another expert cost?"
    When I click on "Save and continue" button
    Then I should see the heading "Upload POA evidence"
    When I upload a file "testDocument2.pdf"
    When I click on "Save and continue" button
    Then I should see the heading "Check your details"
    When I navigate back to the previous page
    When I click on "Back" link
    When I click on "Back" link
    When I click on "Back" link
    Then I should see the heading "What type of POA are you claiming?"
    When I select "Profit cost" radio button for "What type of POA are you claiming?"
    When I click on "Save and continue" button
    Then I should see the heading "Profit cost details"
    When I select "High court" radio button for "Court or judge type"
    When I select "Child" radio button for "What is your client’s party status?"
    When I select "Yes" radio button for "Are you the first solicitor firm acting on this case?"
    When I select "No" radio button for "Has there been a transfer of solicitor on this case?"
    When I click on "Save and continue" button
    When I select "1" radio button for "How many clients did you have at the start of the case"
    When I click on "Save and continue" button
    When I select "Yes" radio button for "Have you attended at least one hearing where you have represented more than one client?"
    When I click on "Save and continue" button
    When I select "Yes" radio button for "Do you wish to escape the standard fixed fee?"
    When I click on "Save and continue" button
    Then I should see the heading "POA CPGFS profit cost bill line"
    When I enter "24" in the "Day" field
    And I enter "12" in the "Month" field
    And I enter "2025" in the "Year" field
    And I enter "1000" in the "Actual net profit cost" field
    And I enter "2000" in the "Actual net advocacy costs" field
    When I select "Yes" radio button for "Does VAT apply?"
    And I enter "Test" in the "Fee earner name" field
    When I click on "Save and continue" button
    Then I should see the heading "Upload POA evidence"
    When I upload a file "testDocument2.pdf"
    Then I should see the uploaded file details for "testDocument2.pdf"
    When I click on "Save and continue" button
    Then I should see the heading "Check your details"
    And I should see the following "Assessment summary" table
      | Item                | Cost |
      | Total net claim     | £0   |
      | Total VAT claim     | £0   |
      | POA total net claim | £0   |
      | Total claim         | £0   |
    And I should see the following rows in the "Profit cost details" summary card
      | Key                         | Value      |
      | Court type                  | High court |
      | Client party status         | Child      |
      | First solicitor?            | Yes        |
      | Transfer of solicitor       | No         |
      | Clients at start of case    | 1          |
      | Attended hearings?          | Yes        |
      | Escaped standard fixed fee? | Yes        |
    And I should see the following rows in the "POA CPGFS profit cost bill line" summary card
      | Key                                       | Value            |
      | Date                                      | 24 December 2025 |
      | Actual net profit cost excluding advocacy | £1,000.00        |
      | Actual net advocacy costs                 | £2,000.00        |
      | Does VAT apply?                           | Yes              |
      | Fee earner name                           | Test             |
    And I should see the following rows in the "Evidence" summary card
      | Key               | Value |
      | testDocument2.pdf | 9KB   |
    Then I click on "Submit" button
    Then I should see the heading "Payment on account submitted"
    Then I click sign out button

  @claim
  Scenario: Expert cost details form should be empty upon clicking back
    Given I log in as user "bob" with password "password"
    When I click on "Payment on account" button
    When I select "Expert cost" radio button for "What type of POA are you claiming?"
    When I click on "Save and continue" button
    Then I should see the heading "Expert cost"
    When I enter "26" in the "Day" field
    And I enter "03" in the "Month" field
    And I enter "2026" in the "Year" field
    And I enter "19" in the "Actual net value" field
    When I select "Yes" radio button for "Does VAT apply?"
    And I enter "Test" in the "Fee earner name" field
    When I click on "Save and continue" button
    Then I should see the following error messages
      | Enter a description of the expert cost |
    When I enter "Test description" in the "Description" field
    And I click on "Save and continue" button
    Then I should see the heading "You have added an expert cost"
    When I click on "Back" link
    Then I should not see an error summary
    And I should see "" in the "Day" field
    And I should see "" in the "Month" field
    And I should see "" in the "Year" field
    And I should see "" in the "Actual net value" field
    And I should see "Yes" not selected for "Does VAT apply?"
    And I should see "No" not selected for "Does VAT apply?"
    And I should see "" in the "Fee earner name" field
    And I should see "" in the "Description" field
    And I click sign out button
