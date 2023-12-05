

@first_steps
Feature: Register on the Test site

@test
Scenario: Register on the Test site
  Given that the user accesses the test site
  When it validates and fills in the form fields
  Then validated the operation of the buttons