Feature: POA Non expert disbursement cost journey E2E

  @smoke @claim
  Scenario: POA - Non expert disbursement cost journey E2E
    Given I log in as user "bob" with password "password"
    When I click on "Payment on account" button
    When I select "Non expert disbursement" radio button for "What type of POA are you claiming?"
    When I click on "Save and continue" button
    Then I should see the heading "Non-expert disbursement"
    When I enter "24" in the "Day" field
    And I enter "12" in the "Month" field
    And I enter "2025" in the "Year" field
    And I enter "1000" in the "Actual net value" field
    When I select "Yes" radio button for "Does VAT apply?"
    And I enter "Test" in the "Fee earner name" field
    And I enter "Test description" in the "Description" field
    When I click on "Save and continue" button
    Then I should see the heading "You have added a non-expert disbursement"
    When I select "Yes" radio button for "Do you need to add another non-expert disbursement?"
    When I click on "Save and continue" button
    Then I should see the heading "Non-expert disbursement"
    When I enter "24" in the "Day" field
    And I enter "12" in the "Month" field
    And I enter "2025" in the "Year" field
    And I enter "1000" in the "Actual net value" field
    When I select "Yes" radio button for "Does VAT apply?"
    And I enter "Test" in the "Fee earner name" field
    And I enter "Test description" in the "Description" field
    When I click on "Save and continue" button
    Then I should see the heading "You have added 2 non-expert disbursements"
    When I select "No" radio button for "Do you need to add another non-expert disbursement?"
    When I click on "Save and continue" button
    Then I should see the heading "Upload POA evidence"
    When I upload a file "testDocument2.pdf"
    When I click on "Save and continue" button
    Then I should see the heading "Check your details"
    And I should see the following "Assessment summary" table
      | Item                | Cost |
      | Total net claim     | £0   |
      | Total VAT claim     | £0   |
      | POA total net claim | £0   |
      | Total claim         | £0   |
    And I should see the following rows in the "1st" "Non-expert disbursement bill line" summary card
      | Key              | Value            |
      | Date             | 24 December 2025 |
      | Actual net value | £1,000.00        |
      | Does VAT apply?  | Yes              |
      | Fee earner name  | Test             |
      | Description      | Test description |
    And I should see the following rows in the "2nd" "Non-expert disbursement bill line" summary card
      | Key              | Value            |
      | Date             | 24 December 2025 |
      | Actual net value | £1,000.00        |
      | Does VAT apply?  | Yes              |
      | Fee earner name  | Test             |
      | Description      | Test description |
    And I should see the following rows in the "Evidence" summary card
      | Key               | Value |
      | testDocument2.pdf | 9KB   |
    Then I click on "Submit" button
    Then I should see the heading "Payment on account submitted"
    When I click the "guidance on processing timescales" link which opens in a new tab
    Then I should see another page with the heading "Civil processing dates"
    Then I should see a link "Return to claim summary page"
    Then I click sign out button

  @smoke @claim
  Scenario: POA - Non expert disbursement removal journey E2E
    Given I log in as user "bob" with password "password"
    When I click on "Payment on account" button
    When I select "Non expert disbursement" radio button for "What type of POA are you claiming?"
    When I click on "Save and continue" button
    Then I should see the heading "Non-expert disbursement"
    When I enter "24" in the "Day" field
    And I enter "12" in the "Month" field
    And I enter "2025" in the "Year" field
    And I enter "1000" in the "Actual net value" field
    When I select "Yes" radio button for "Does VAT apply?"
    And I enter "Test" in the "Fee earner name" field
    And I enter "Test description" in the "Description" field
    When I click on "Save and continue" button
    Then I should see the heading "You have added a non-expert disbursement"
    When I select "Yes" radio button for "Do you need to add another non-expert disbursement?"
    When I click on "Save and continue" button
    Then I should see the heading "Non-expert disbursement"
    When I enter "29" in the "Day" field
    And I enter "10" in the "Month" field
    And I enter "2021" in the "Year" field
    And I enter "3000" in the "Actual net value" field
    When I select "Yes" radio button for "Does VAT apply?"
    And I enter "Test" in the "Fee earner name" field
    And I enter "Test description" in the "Description" field
    When I click on "Save and continue" button
    Then I should see the heading "You have added 2 non-expert disbursements"
    When I click on the "Remove" link for "24 December 2025"
    Then I should see the heading "Are you sure you want to remove this non-expert disbursement?"
    Then I select "Yes" radio button for "Are you sure you want to remove this non-expert disbursement?"
    When I click on "Save and continue" button
    Then I should see the heading "You have added a non-expert disbursement"
    When I select "No" radio button for "Do you need to add another non-expert disbursement?"
    When I click on "Save and continue" button
    Then I should see the heading "Upload POA evidence"
    When I upload a file "testDocument.pdf"
    When I click on "Save and continue" button
    Then I should see the heading "Check your details"
    And I should see the following "Assessment summary" table
      | Item                | Cost |
      | Total net claim     | £0   |
      | Total VAT claim     | £0   |
      | POA total net claim | £0   |
      | Total claim         | £0   |
    And I should see the following rows in the "Non-expert disbursement bill line" summary card
      | Key              | Value            |
      | Date             | 29 October 2021  |
      | Actual net value | £3,000.00        |
      | Does VAT apply?  | Yes              |
      | Fee earner name  | Test             |
      | Description      | Test description |
    And I should see the following rows in the "Evidence" summary card
      | Key              | Value |
      | testDocument.pdf | 9KB   |
    Then I click on "Submit" button
    Then I should see the heading "Payment on account submitted"
    When I click the "guidance on processing timescales" link which opens in a new tab
    Then I should see another page with the heading "Civil processing dates"
    Then I should see a link "Return to claim summary page"
    Then I click sign out button

  @claim
  Scenario: Non-expert disbursement details form should be empty upon clicking back
    Given I log in as user "bob" with password "password"
    When I click on "Payment on account" button
    When I select "Non expert disbursement" radio button for "What type of POA are you claiming?"
    When I click on "Save and continue" button
    Then I should see the heading "Non-expert disbursement"
    When I enter "26" in the "Day" field
    And I enter "03" in the "Month" field
    And I enter "2026" in the "Year" field
    And I enter "19" in the "Actual net value" field
    When I select "Yes" radio button for "Does VAT apply?"
    And I enter "Test" in the "Fee earner name" field
    When I click on "Save and continue" button
    Then I should see the following error messages
      | Enter a description of the non-expert disbursement |
    When I enter "Test description" in the "Description" field
    And I click on "Save and continue" button
    Then I should see the heading "You have added a non-expert disbursement"
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

  @smoke @claim
  Scenario: Business Rule C-POA-09 - claim line is £19.99 or LESS
    Given I log in as user "bob" with password "password"
    When I click on "Payment on account" button
    When I select "Non expert disbursement" radio button for "What type of POA are you claiming?"
    When I click on "Save and continue" button
    Then I should see the heading "Non-expert disbursement"
    When I enter "24" in the "Day" field
    And I enter "12" in the "Month" field
    And I enter "2025" in the "Year" field
    And I enter "19.99" in the "Actual net value" field
    When I select "Yes" radio button for "Does VAT apply?"
    And I enter "Test" in the "Fee earner name" field
    And I enter "Test description" in the "Description" field
    When I click on "Save and continue" button
    Then I should see the heading "You have added a non-expert disbursement"
    When I select "No" radio button for "Do you need to add another non-expert disbursement?"
    When I click on "Save and continue" button
    Then I should see the heading "Check your details"
    Then I click on "Submit" button
    Then I should see the heading "Payment on account submitted"
    Then I click sign out button

  @smoke @claim
  Scenario: Evidence is not required for £19.99 or LESS (multiple lines)
    Given I log in as user "bob" with password "password"
    When I click on "Payment on account" button
    When I select "Non expert disbursement" radio button for "What type of POA are you claiming?"
    When I click on "Save and continue" button
    Then I should see the heading "Non-expert disbursement"
    When I enter "24" in the "Day" field
    And I enter "12" in the "Month" field
    And I enter "2025" in the "Year" field
    And I enter "19.99" in the "Actual net value" field
    When I select "Yes" radio button for "Does VAT apply?"
    And I enter "Test" in the "Fee earner name" field
    And I enter "Test description" in the "Description" field
    When I click on "Save and continue" button
    Then I should see the heading "You have added a non-expert disbursement"
    When I select "Yes" radio button for "Do you need to add another non-expert disbursement?"
    When I click on "Save and continue" button
    Then I should see the heading "Non-expert disbursement"
    When I enter "24" in the "Day" field
    And I enter "12" in the "Month" field
    And I enter "2025" in the "Year" field
    And I enter "19.98" in the "Actual net value" field
    When I select "Yes" radio button for "Does VAT apply?"
    And I enter "Test" in the "Fee earner name" field
    And I enter "Test description" in the "Description" field
    When I click on "Save and continue" button
    Then I should see the heading "You have added 2 non-expert disbursements"
    When I select "No" radio button for "Do you need to add another non-expert disbursement?"
    When I click on "Save and continue" button
    Then I should see the heading "Check your details"
    Then I click on "Submit" button
    Then I should see the heading "Payment on account submitted"
    Then I click sign out button

  @smoke @claim
  Scenario: Business Rule C-POA-09 - one claim line is < 20 and another one >20
    Given I log in as user "bob" with password "password"
    When I click on "Payment on account" button
    When I select "Non expert disbursement" radio button for "What type of POA are you claiming?"
    When I click on "Save and continue" button
    Then I should see the heading "Non-expert disbursement"
    When I enter "24" in the "Day" field
    And I enter "12" in the "Month" field
    And I enter "2025" in the "Year" field
    And I enter "19.99" in the "Actual net value" field
    When I select "Yes" radio button for "Does VAT apply?"
    And I enter "Test Fee earner" in the "Fee earner name" field
    And I enter "Test description 1" in the "Description" field
    When I click on "Save and continue" button
    Then I should see the heading "You have added a non-expert disbursement"
    When I select "Yes" radio button for "Do you need to add another non-expert disbursement?"
    When I click on "Save and continue" button
    Then I should see the heading "Non-expert disbursement"
    When I enter "24" in the "Day" field
    And I enter "10" in the "Month" field
    And I enter "2025" in the "Year" field
    And I enter "20" in the "Actual net value" field
    When I select "Yes" radio button for "Does VAT apply?"
    And I enter "Test Fee Earner two" in the "Fee earner name" field
    And I enter "Test description2" in the "Description" field
    When I click on "Save and continue" button
    Then I should see the heading "You have added 2 non-expert disbursements"
    When I select "No" radio button for "Do you need to add another non-expert disbursement?"
    When I click on "Save and continue" button
    Then I should see the heading "Upload POA evidence"
    When I upload a file "testDocument.pdf"
    When I click on "Save and continue" button
    Then I should see the heading "Check your details"
    And I should see the following "Assessment summary" table
      | Item                | Cost |
      | Total net claim     | £0   |
      | Total VAT claim     | £0   |
      | POA total net claim | £0   |
      | Total claim         | £0   |
    And I should see the following rows in the "1st" "Non-expert disbursement bill line" summary card
      | Key              | Value              |
      | Date             | 24 December 2025   |
      | Actual net value | £19.99             |
      | Does VAT apply?  | Yes                |
      | Fee earner name  | Test Fee earner    |
      | Description      | Test description 1 |
    And I should see the following rows in the "2nd" "Non-expert disbursement bill line" summary card
      | Key              | Value               |
      | Date             | 24 October 2025     |
      | Actual net value | £20.00              |
      | Does VAT apply?  | Yes                 |
      | Fee earner name  | Test Fee Earner two |
      | Description      | Test description2   |
    And I should see the following rows in the "Evidence" summary card
      | Key              | Value |
      | testDocument.pdf | 9KB   |
    Then I click on "Submit" button
    Then I should see the heading "Payment on account submitted"
    Then I click sign out button


  @smoke @claim
  Scenario: Evidence is not required info alert
    Given I log in as user "bob" with password "password"
    When I click on "Payment on account" button
    When I select "Non expert disbursement" radio button for "What type of POA are you claiming?"
    When I click on "Save and continue" button
    Then I should see the heading "Non-expert disbursement"
    When I enter "24" in the "Day" field
    And I enter "11" in the "Month" field
    And I enter "2025" in the "Year" field
    And I enter "19.99" in the "Actual net value" field
    When I select "Yes" radio button for "Does VAT apply?"
    And I enter "Test Fee earner" in the "Fee earner name" field
    And I enter "Test description 1" in the "Description" field
    When I click on "Save and continue" button
    Then I should see the heading "You have added a non-expert disbursement"
    When I select "Yes" radio button for "Do you need to add another non-expert disbursement?"
    When I click on "Save and continue" button
    Then I should see the heading "Non-expert disbursement"
    When I enter "24" in the "Day" field
    And I enter "12" in the "Month" field
    And I enter "2025" in the "Year" field
    And I enter "20" in the "Actual net value" field
    When I select "Yes" radio button for "Does VAT apply?"
    And I enter "Test Fee Earner two" in the "Fee earner name" field
    And I enter "Test description2" in the "Description" field
    When I click on "Save and continue" button
    Then I should see the heading "You have added 2 non-expert disbursements"
    When I select "No" radio button for "Do you need to add another non-expert disbursement?"
    When I click on "Save and continue" button
    Then I should see the heading "Upload POA evidence"
    When I upload a file "testDocument.pdf"
    When I click on "Save and continue" button
    Then I should see the heading "Check your details"
    Then I navigate back to the previous page
    When I click on "Back" link
    Then I should see the heading "You have added 2 non-expert disbursements"
    When I click on the "Remove" link for "24 December 2025"
    Then I should see the heading "Are you sure you want to remove this non-expert disbursement?"
    Then I select "Yes" radio button for "Are you sure you want to remove this non-expert disbursement?"
    When I click on "Save and continue" button
    When I select "No" radio button for "Do you need to add another non-expert disbursement?"
    When I click on "Save and continue" button
    Then I should see an alert message "Evidence is not required for disbursements under £20"
    Then I click sign out button
