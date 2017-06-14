@search @smoke
Feature: Basic hotel search on mobile browser

  Scenario Outline: User is able to perform basic search for a hotel with selecting specific dates and city
    Given Open "Hotel Tonight" home page
    Then Close "Get the HotelTonight App" overlay
    Then Verify the message is displayed "Amazing last minute hotel deals for tonight, tomorrow and next week"
    Then Type in search term "<search_term>"
    And Select "<search_term>" from suggestions list
    Then Select check-in date in "<check_in_day>" days form today
    And Select duration of stay "<check_out_day>" nights: min 1, max 5
    Then Click "Search Hotels" button
    Then Verify that landed on the search results page
    Then Verify that search results include "<search_term>" and date
    Then Click on 1st item in the search results and verify that search results include "<search_term>"

    Examples:
       | search_term   | check_in_day | check_out_day |
       | New York City | 0            | 1             |
       | San Francisco | 1            | 2             |
       | Boston        | 2            | 3             |
       | Chicago       | 3            | 4             |
       | Paris         | 4            | 1             |
       | Moscow        | 5            | 2             |
       | Las Vegas     | 6            | 3             |