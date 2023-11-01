Feature: Login related Test Cases

  @run
  Scenario Outline: An error message is displayed when using invalid <affectedAttribute>for login flow
    Given "/index.php?route=account/login&language=en-gb" end point is accessed
    When the login form is populated with the following details:
      | <email>    |
      | <password> |

    Then The following list of error messages is displayed:
      | Warning: No match for E-Mail Address and/or Password. |

    Examples:
      | email                        | password       | affectedAttribute |
      | postolachi.ruxanda@gmail.com | The Password!1 | password          |
      | postolachi.com               | The Password1  | password          |