class SignInPage < ScreenActions

  def register_firstname
    $driver.find_element(:xpath, "//input[@id = 'firstName']")
  end

  def register_lastname
    $driver.find_element(:xpath, "//input[@id = 'lastName']")
  end

  def register_email
    $driver.find_element(:xpath, "//input[@id = 'email']")
  end

  def resister_pass
   $driver.find_element(:xpath, "//input[@id = 'password']")
  end

  def sign_up_button_click
    $driver.find_element(:xpath, "//div[@data-click = 'signUpButton']").click
    sleep(*3)
  end

end


