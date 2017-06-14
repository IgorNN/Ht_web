class UserProfilePage < ScreenActions

  def profile_user_name
    array_of_elements = $driver.find_elements(:xpath,"//span[contains(text(),'')]").collect(&:text)
    ind = array_of_elements.index { |x| x == $firstname }
    return array_of_elements[ind]
end

end


