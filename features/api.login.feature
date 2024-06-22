Feature: User Login API

  Scenario Outline: Verify successful login post
    Given username:"<username>" with password:"<password>"
    When  The user posts to the login api endpoint with "<username>" and "<password>"
    Then  The resulting status code should be "<expected_status_code>"

    Examples:
    | username   | password   | expected_status_code  |
    | mucker2    | mucker2    | ok                   |

  Scenario Outline: Verify unsuccessful login post
    When  The user posts to the login api endpoint with "<username>" and "<password>"
    Then  The resulting status code should be "unauthorized"
    And   The response body should contain "<field>" with "<value>"

    Examples:
    | username              | password   | field         | value                |
    | mucker2               | wrong_pass | errorMessage  | Wrong password.      |
    | mucker2               | Mucker2    | errorMessage  | Wrong password.      |
    | MUCKER2               | mucker2    | errorMessage  | User does not exist. |
    | nonexistent_username  | wrong_pass | errorMessage  | User does not exist. |
