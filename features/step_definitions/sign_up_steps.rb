Then(/^Click MENU button$/) do
  home_page.menu_button.click
end

Then(/^Click "([^"]*)" link$/) do |link_text|
  home_page.link_click link_text
end

Then /^Enter (First Name|Last Name|Email|Password)/ do |user_data|

  if user_data == "First Name"
    $firstname = Faker::Name.first_name
    sign_in_page.register_firstname.send_keys $firstname

  elsif user_data == "Last Name"
    sign_in_page.register_lastname.send_keys Faker::Name.last_name

  elsif user_data == "Email"
    sign_in_page.register_email.send_keys Faker::Internet.email

  elsif user_data == "Password"
    @password = Faker::Internet.password
    sign_in_page.resister_pass.send_keys @password

  end
end

Then(/^Click SIGN UP button$/) do
  sign_in_page.sign_up_button_click
end


Then(/^Verify that user profile has correct user name$/) do
  @profile_first_name = user_profile_page.profile_user_name
  expect($firstname).to include (@profile_first_name)
end