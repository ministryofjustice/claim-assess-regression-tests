Feature: POA Expert cost add/remove scenarios

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
    When I click on the "Remove" link for the expert cost dated "26 March"
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