# ht-automation-igor-namakonov

Using the latest version of Selenium in the language of your choice (preferably in Ruby, Java, or Javascript), build an automation project that will validate the functionality and states of the hoteltonight homepage with **a mobile user-agent on a desktop browser**. 

**Test Target** <br>

**Site:** https://www.hoteltonight.com using a desktop browser with a mobile user-agent<br>

**Tests at a minimum should prove:** <br>
&nbsp;  * Page loads <br>
&nbsp;  * Change the check-in and check-out dates <br>
&nbsp;  * Perform a search for "New York City" <br>

**Source Control:** <br>
Create a Pull Request for your changes and tag @scottgast2007 and @veasna-t on the HotelTonight provided Github repository<br>
    
The completed state of this project should show results that the pages are loading as expected with existing functionality.</br>
You are encouraged to build out validation that could help enhance validation of other interactions on the page.</br>
Also, please include any dependencies and the reason for using those libraries in the bottom of this readme.md file. 

**The following dependencies were used for the project:** <br>

&nbsp; 'cucumber' - business layer wrapper for the tests <br>
&nbsp; 'selenium-webdriver' 3.4.0 - driver <br>
&nbsp; 'rspec' - for  matchers, assertions, expectation <br>
&nbsp; 'pry' - as a debugging tool <br>
&nbsp; 'faker' - generate user credentials for Sign Up feature <br>