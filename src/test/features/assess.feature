Feature: Assess - Login and Claims Home Page

  @smoke @assess
  Scenario: The caseworker logs in and land on Assess home page
    Given I log in as user "alice" with password "password"
    Then I should see the page title "Your Assessments – Assess claim for civil work – GOV.UK"
    Then I should see the heading "Your Assessments"
    When I click on "LAA-001" link
    Then I should see the heading "Fixed fee: Special Children Act (Care)"
    When I click on "Back" link
    Then I should see the heading "Your Assessments"
    When I click sign out button

  @smoke @assess
  Scenario: The caseworker logs in and verifies Claim Summary page
    Given I log in as user "alice" with password "password"
    Then I should see the page title "Your Assessments – Assess claim for civil work – GOV.UK"
    Then I should see the heading "Your Assessments"
    When I click on "LAA-001" link
    Then I should see the heading "Fixed fee: Special Children Act (Care)"
    Then I should see the following "summary" list
      | Key                   | Value            |
      | Total claim amount    | £3,480           |
      | Date received         | 27 February 2026 |
      | Case reference number | 300001820960     |
      | LAA reference number  | LAA-90d26c       |
      | Assigned to           | Caseworker name  |
      | Provider risk         | Low              |
      | Claim time standard   | 15 minutes       |
    And I should see the following sub-navigation
      | Tab               |
      | Claim summary     |
      | Review and assess |
      | Claim history     |
      | All evidence      |
    And I should see the following rows in the "Costs and allocations" summary card
      | Key                         | Value                |
      | Claim type                  | Solicitor final bill |
      | Total claim amount          | £3,480               |
      | Assessment basis            | Fixed fee applies    |
      | Counsel cost and allocation | £900                 |
      | Available cost limit        | £24,100 (of £25,000) |
    And I should see the following rows in the "Providers" summary card
      | Key                  | Value                 |
      | Solicitor name       | Smith & Co Solicitors |
      | Solicitor region     | North West            |
      | Number of solicitors | 1                     |
      | Counsel involved     | Yes                   |
      | Counsel payment      | Paid and Reconciled   |
    And I should see the following rows in the "Client" summary card
      | Key           | Value         |
      | Name          | Liam Oldfield |
      | Date of birth | 27 March 1996 |
      | Location      | Manchester    |
      | Status        | Parent        |
    And I should see the following rows in the "Case" summary card
      | Key             | Value                   |
      | Matter type     | Special Children Act    |
      | Lead proceeding | Care order              |
      | Linked cases    | 1 linked case           |
      | Outcome         | Final hearing completed |
    And I should see the following rows in the "Certificate scope" summary card
      | Key              | Value                                                               |
      | Type             | Substantive Certificate                                             |
      | Description      | To be represented on an application for Care Order                  |
      | Limitation       | All steps up to and including final hearing, limited to family help |
      | Issue date       | 27 February 2026                                                    |
      | Status           | Discharged 28 February 2026                                         |
      | Level of service | Full representation                                                 |
    And I should see the following rows in the "Proceedings" summary card
      | Key               | Value                                                        |
      | Care order        | Start date 25 February 2026 Final hearing completed (PB0057) |
      | Supervision order | 12 November 2025 Withdrawn (PB0142)                          |
    When I click on "Back" link
    Then I should see the heading "Your Assessments"
    When I click sign out button
