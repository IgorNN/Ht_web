class HomePage < ScreenActions

def open_homepage
 $driver.get 'https://www.hoteltonight.com/'
 begin
   $wait.until { $driver.find_element(:xpath, "//*[@id = 'ht']") }
 rescue
   raise assets_element_was_not_found
 end
end

def home_page_displayed?(title)
  begin
    $wait.until { $driver.find_element(:xpath, "//span[contains(text(), '#{title}')]").displayed? }
  rescue
    raise assets_element_was_not_found
  end
end


def close_overlay(overlay)
  overlay_message = $driver.find_element(:xpath,"//div[contains(text(),'#{overlay}')]").text
  expect(overlay_message).to eq(overlay)
  overlay_button = $driver.find_element(:xpath, "//*[@data-click = 'close']")
  overlay_button.click
end

def pagetitle message
  begin
    $wait.until { $driver.find_element(:xpath,"//div[contains(text(),'#{message}')]") }
  rescue
    raise assets_element_was_not_found
  end
end

def search_field
  $driver.find_element(:xpath,"//input[@data-click = 'search-input']")
end

def check_in_dropdown
  $driver.find_element(:xpath, "//*[@data-click = 'check_in']")
end

def select_check_in in_days
  $driver.find_element(:xpath, "//*[@data-click = 'check_in_#{in_days}']").click
  $check_in_day = ($current_day + (in_days.to_i*24*60*60))
end

def check_out_dropdown
  $driver.find_element(:xpath, "//*[@data-click = 'check_out']")
end

def select_check_out in_days
  $driver.find_element(:xpath, "//*[@data-click = 'check_out_#{in_days.to_i - 1}']").click
  $check_out_day = ($check_in_day + ((in_days.to_i)*24*60*60))
end

def suggestion_list search_term
  begin
    $wait.until {$driver.find_elements(:xpath, "//*[contains(@data-click, 'suggestion')]")}
  rescue
    raise assets_element_was_not_found
  end
  list = $driver.find_elements(:xpath, "//*[contains(@data-click, 'suggestion')]").collect(&:text)
  ind = list.index { |x| x.include? search_term }
  return list[ind]
end

def select_from_suggestion_list search_term
  list = $driver.find_elements(:xpath, "//*[contains(@data-click, 'suggestion')]").collect(&:text)
  list2 = $driver.find_elements(:xpath, "//*[contains(@data-click, 'suggestion')]")
  ind = list.index { |x| x.include? search_term }
  list2[ind].click
end

def menu_button
  $driver.find_element(:xpath, "//*[@id = 'MENU']")
end


end


