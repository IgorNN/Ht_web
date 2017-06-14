class ScreenActions

  include RSpec::Matchers

  def assets_element_was_not_found
    Selenium::WebDriver::Error::NoSuchElementError || Selenium::WebDriver::Error::InvalidSelectorError
  end

  def link_click(link_name)
    $driver.find_element(:link_text, "#{link_name}").click
  end

  def button_click(button_name)
    begin
      button = $wait.until { $driver.find_element(:xpath,"//*[contains(text(),'#{button_name}')]") }
      button.click
    rescue
      raise assets_element_was_not_found
    end
    sleep(*3)
  end

end