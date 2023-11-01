
@run
Feature: Register Flow Test Suite


  Scenario: Register Page can be accessed from the Home Page
    Given "/" end point is accessed
    When registerLink from Header menu is clicked
    Then the current url contains "route=account/register" keyword


  Scenario: The Account Page URL is opened when the registration is successful
    Given "/index.php?route=account/register" end point is accessed
    When the register form is populated with valid random data
    And Continue button is clicked
    Then the current url contains "route=account/success" keyword

  Scenario: User remains on registerPage when the continue button is not clicked
    Given "/index.php?route=account/register" end point is accessed
    When the register form is populated with valid random data
    Then the current url contains "route=account/register" keyword

  @run
  Scenario Outline: An error message is displayed when invalid  <impacted attribute> is used for register flow
    Given "/index.php?route=account/register" end point is accessed
    When the register form is populated with the following data:
      | firstName | <firstName>    |
      | lastName  | <lastName>     |
      | email     | <emailData>    |
      | password  | <passwordData> |
     And Continue button is clicked
     Then The following list of error messages is displayed:
       | <impacted attribute> must be between 1 and 32 characters! |

     Examples:
       | impacted attribute | firstName                          | lastName                           | emailData | passwordData |
       | First Name         | 8555555444555545454844545dddd55555 | Random                             | Random    | Random       |
       | Last Name          | Random                             | 5215524558652365854125963254253333 | Random    | Random       |



