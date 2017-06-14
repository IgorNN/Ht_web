@sign_up @smoke
Feature: User sign up

  Scenario: User is able to create an account
    Given Open "Hotel Tonight, Inc" home page
    Then Close "Get the HotelTonight App" overlay
    Then Verify the message is displayed "Amazing last minute hotel deals for tonight, tomorrow and next week"
    Then Click MENU button
    Then Click "Sign Up" link
    Then Enter First Name
    Then Enter Last Name
    Then Enter Email
    And Enter Password
    Then Click SIGN UP button
    Then Verify that user profile has correct user name

