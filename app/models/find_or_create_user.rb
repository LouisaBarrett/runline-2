class FindOrCreateUser
 
  def self.find_or_create_by_auth(user_data)
    where(:provider => user_data.provider, :uid => user_data.uid).first_or_create(
      username: user_data.first_name + " " + user_data.last_name,
      email: user_data.email,
      token: user_data.token
    )
  end

end
