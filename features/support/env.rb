require 'rubygems'
require 'selenium-webdriver'
require 'cucumber'
require 'pry'
require 'rspec'
require 'faker'


$dropdown = Selenium::WebDriver::Support::Select
$wait = Selenium::WebDriver::Wait.new(:timeout => 10)
$delete_cookies = Selenium::WebDriver::Options.new(:delete_all_cookies)
$current_day = Time.now


def home_page
  @home_page ||= HomePage.new
end

def screen_actions
  @screen_actions ||= ScreenActions.new
end

def search_results_page
  @search_results_page ||= SearchResultsPage.new
end

def sign_in_page
  @sign_in_page ||= SignInPage.new
end

def user_profile_page
  @user_profile_page ||= UserProfilePage.new
end
