Feature: User Signup API

  Scenario: Verify successful signup post
    When  The user posts to the signup api endpoint with a valid new username and password
    Then  The resulting status code should be "created"

  Scenario Outline: Verify unsuccessful signup post with existing username
    Given username:"<username>" with password:"<expected_password>"
    When  The user posts to the signup api endpoint with existing "<username>" and "<given_password>"
    Then  The resulting status code should be "<expected_status>"
    And   The response body should contain "<expected_field>" with "<expected_value>"

    Examples:
    | username  | expected_password | given_password  | expected_status | expected_field  | expected_value            |
    | mucker2   | mucker2           | mucker3         | conflict        | errorMessage    | This user already exist.  |