class SearchResultsPage < ScreenActions

def search_results_page_displayed?
 begin
   $wait.until { $driver.find_element(:xpath, "//*[contains(@data-click, 'statusBar')]").displayed? }
 rescue
   raise assets_element_was_not_found
 end
end

def error_message_displayed?
  begin
    $wait.until { $driver.find_element(:xpath,"//div[contains(text(),'Looks like we're not there... yet.)]").displayed? }
  rescue
    raise assets_element_was_not_found
  end
end

def search_results_text
  $driver.find_element(:xpath, "//*[contains(@data-click, 'statusBar')]").text
 end

def inventory_items
  begin
    $wait.until { $driver.find_elements(:xpath, "//*[contains(@data-click, 'inventoryItemName')]") }
  rescue
    raise assets_element_was_not_found
  end
end

def hotel_address
  begin
    $wait.until {  $driver.find_element(:xpath, "//*[contains(@data-click, 'hotelAddress')]") }
  rescue
    raise assets_element_was_not_found
  end
end

def no_hotels_message
  $driver.find_element(:xpath, "//*[contains(@data-click, 'NOhotelAddress')]")
end


end


