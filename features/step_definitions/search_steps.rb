Given /^Open "([^"]*)" home page$/ do |title|
  home_page.open_homepage
  expect(home_page.home_page_displayed? title).to be true
end

Then (/^Close "([^"]*)" overlay$/) do |overlay|
  home_page.close_overlay overlay
end

Then /^Verify the message is displayed "([^"]*)"$/ do |pagetitle|
  expect(home_page.pagetitle(pagetitle).text.downcase).to eq(pagetitle.downcase)
end

Then(/^Type in search term "([^"]*)"$/) do |search_term|
  home_page.search_field.click
  home_page.search_field.send_keys search_term
end

And(/^Select "([^"]*)" from suggestions list$/) do |search_term|
  expect(home_page.suggestion_list(search_term).downcase).to include(search_term.downcase)
  home_page.select_from_suggestion_list(search_term)
end

Then /^Select check-in date in "([^"]*)" days form today$/ do |check_in_day|
  home_page.check_in_dropdown.click
  home_page.select_check_in check_in_day
end

And /^Select duration of stay "([^"]*)" nights: min 1, max 5$/ do |check_out_day|
  home_page.check_out_dropdown.click
  home_page.select_check_out check_out_day
end

Then(/^Click "([^"]*)" button$/) do |button_name|
  home_page.button_click button_name
end


Then(/^Verify that landed on the search results page$/) do
  expect(search_results_page.search_results_page_displayed?).to be true
end

Then(/^Verify that search results include "([^"]*)" and date$/) do |search_term|
  expect(search_results_page.search_results_text.downcase).to include (search_term.downcase)
  expect(search_results_page.search_results_text.gsub(/[\n]/, ' ')).to include ($check_in_day.strftime("%^a %d"))
  expect(search_results_page.search_results_text.gsub(/[\n]/, ' ')).to include ($check_out_day.strftime("%^a %d"))
end

Then(/^Click on (\d+)(?:st|nd|rd|th)? item in the search results and verify that search results include "([^"]*)"$/) do |cell, search_term|
  search_results_page.inventory_items[cell.to_i-1].click
  expect(search_results_page.hotel_address.text.downcase).to include (search_term.downcase.gsub " city", "")
end