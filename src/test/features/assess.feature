# Feature: Assess - Login and Claims Home Page

#   @smoke @assess
#   Scenario: The caseworker logs in and land on Assess home page
#     Given I log in as user "alice" with password "password"
#     Then I should see the page title "Your Assessments – Assess claim for civil work – GOV.UK"
#     Then I should see the heading "Your Assessments"
#     When I click on "LAA-001" link
#     Then I should see the heading "Fixed fee: Special Children Act (Care)"
#     When I click on "Back" link
#     Then I should see the heading "Your Assessments"
#     When I click sign out button

#   @smoke @assess
#   Scenario: The caseworker logs in and verifies Claim Summary page
#     Given I log in as user "alice" with password "password"
#     Then I should see the page title "Your Assessments – Assess claim for civil work – GOV.UK"
#     Then I should see the heading "Your Assessments"
#     When I click on "LAA-001" link
#     Then I should see the heading "Fixed fee: Special Children Act (Care)"
#     Then I should see the following Elements on Claim Summary page
#       | Elements              |
#       | In progress           |
#       | Total claim amount    |
#       | Date received         |
#       | Case reference number |
#       | LAA reference number  |
#       | Assigned to           |
#       | Provider risk         |
#       | Claim time standard   |
#       | Remove from your list |
#     When I click on "Back" link
#     Then I should see the heading "Your Assessments"
#     When I click sign out button

#   @smoke @assess
#   Scenario: The caseworker logs in and verifies Claim summary tabbed box
#     Given I log in as user "alice" with password "password"
#     Then I should see the page title "Your Assessments – Assess claim for civil work – GOV.UK"
#     Then I should see the heading "Your Assessments"
#     When I click on "LAA-001" link
#     Then I should see the heading "Fixed fee: Special Children Act (Care)"
#     Then I should see the following Elements on Claim summary tabbed box
#       | Elements          |
#       | Claim summary     |
#       | Review and assess |
#       | Claim History     |
#       | All evidence      |
#     When I click on "Back" link
#     Then I should see the heading "Your Assessments"
#     When I click sign out button

#   @smoke @assess
#   Scenario: The caseworker logs in and verifies case related information
#     Given I log in as user "alice" with password "password"
#     Then I should see the page title "Your Assessments – Assess claim for civil work – GOV.UK"
#     Then I should see the heading "Your Assessments"
#     When I click on "LAA-001" link
#     Then I should see the heading "Fixed fee: Special Children Act (Care)"
#     Then I should see the following Elements on Claim summary tabbed box
#       | Elements                     |
#       | Case                         |
#       | Certificate scope            |
#       | Proceedings                  |
#       | Outcome                      |
#       | Level of service             |
#       | Supervision order            |
#       | Request update from provider |
#       | Make a decision              |
#     When I click on "Back" link
#     Then I should see the heading "Your Assessments"
#     When I click sign out button