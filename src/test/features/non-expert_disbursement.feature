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
    # Then I should see the uploaded file details for "testDocument2.pdf"
    When I click on "Save and continue" button
    Then I should see the heading "Check your details"
    Then I should see the following details on the "Check your details" page
      | Locator                   |
      | text=Assessment summary   |
      | #disbursement-bill-line-1 |
      | #disbursement-bill-line-2 |
      | #evidence                 |
    Then I click on "Submit" button
    Then I should see the heading "Payment on account submitted"
    When I click the guidance on processing timescales link
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
    When I click on the "Remove" link for the disbursement dated "24 December"
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
    Then I should see the following details on the "Check your details" page
      | Locator                   |
      | text=Assessment summary   |
      | #disbursement-bill-line-1 |
      | #evidence                 |
    Then I click on "Submit" button
    Then I should see the heading "Payment on account submitted"
    When I click the guidance on processing timescales link
    Then I should see another page with the heading "Civil processing dates"
    Then I should see a link "Return to claim summary page"
    Then I click sign out button