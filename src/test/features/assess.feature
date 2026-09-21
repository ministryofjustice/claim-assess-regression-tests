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
    Then I should see the following summary on the Claim summary page
      | Key                   | Value                 |
      | Total claim amount    | £3,480                |
      | Date received         | 27 February 2026      |
      | Case reference number | 300001820960          |
      | LAA reference number  | LAA-90d26c            |
      | Assigned to           | Caseworker name       |
      | Provider risk         | Low                   |
      | Claim time standard   | 15 minutes            |
    And I should see the following sub-navigation
      | Tab               |
      | Claim summary     |
      | Review and assess |
      | Claim history     |
      | All evidence      |
    And I should see the following summary cards on the Claim summary page
      | Card                  | Key                         | Value                                                               |
      | Costs and allocations | Claim type                  | Solicitor final bill                                                |
      | Costs and allocations | Total claim amount          | £3,480                                                              |
      | Costs and allocations | Assessment basis            | Fixed fee applies                                                   |
      | Costs and allocations | Counsel cost and allocation | £900                                                                |
      | Costs and allocations | Available cost limit        | £24,100 (of £25,000)                                                |
      | Providers             | Solicitor name              | Smith & Co Solicitors                                               |
      | Providers             | Solicitor region            | North West                                                          |
      | Providers             | Number of solicitors        | 1                                                                   |
      | Providers             | Counsel involved            | Yes                                                                 |
      | Providers             | Counsel payment             | Paid and Reconciled                                                 |
      | Client                | Name                        | Liam Oldfield                                                       |
      | Client                | Date of birth               | 27 March 1996                                                       |
      | Client                | Location                    | Manchester                                                          |
      | Client                | Status                      | Parent                                                              |
      | Case                  | Matter type                 | Special Children Act                                                |
      | Case                  | Lead proceeding             | Care order                                                          |
      | Case                  | Linked cases                | 1 linked case                                                       |
      | Case                  | Outcome                     | Final hearing completed                                             |
      | Certificate scope     | Type                        | Substantive Certificate                                             |
      | Certificate scope     | Description                 | To be represented on an application for Care Order                  |
      | Certificate scope     | Limitation                  | All steps up to and including final hearing, limited to family help |
      | Certificate scope     | Issue date                  | 27 February 2026                                                    |
      | Certificate scope     | Status                      | Discharged 28 February 2026                                         |
      | Certificate scope     | Level of service            | Full representation                                                 |
      | Proceedings           | Care order                  | Start date 25 February 2026 Final hearing completed (PB0057)        |
      | Proceedings           | Supervision order           | 12 November 2025 Withdrawn (PB0142)                                 |
    When I click on "Back" link
    Then I should see the heading "Your Assessments"
    When I click sign out button
