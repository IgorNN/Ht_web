Before do

  profile = Selenium::WebDriver::Firefox::Profile.new
  profile.native_events = false
  profile['general.useragent.override'] = 'Mozilla/5.0 (iPhone; CPU iPhone OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Mobile/10A5376e'
  $driver = Selenium::WebDriver.for(:firefox, :profile => profile)

  $driver.manage.window.resize_to(414, 736)
  $delete_cookies

end

AfterStep do
  $driver.manage.timeouts.implicit_wait = 5
end

After do |scenario|

  if scenario.failed?
    screenshots_dir = File.join(File.dirname(__FILE__), "..", "FailedScreenshots")
    if !File.directory?(screenshots_dir)
      raise "!!!Cannot capture screenshots!!! Screenshot directory #{screenshots_dir} exists but isn't a directory" if File.exists? screenshots_dir
      FileUtils.mkdir_p(screenshots_dir)
    end
    time_stamp = Time.now.strftime("%Y-%m-%d_at_%H.%M.%S").to_s
    screenshot_name = "#{time_stamp}_failure_#{scenario.name}.png"
    screenshot_file = File.join(screenshots_dir, screenshot_name)
    sleep 1
    $driver.save_screenshot(screenshot_file)
    embed("#{screenshot_file}", 'image/png')
  end

  $driver.close

end