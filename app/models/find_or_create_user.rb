class FindOrCreateUser
  def self.find_or_create_by_auth(user_data)
    if Authentication.where(provider: user_data.provider, uid: user_data.uid).exists?
      auth = Authentication.where(provider: user_data.provider, uid: user_data.uid).first
      auth.user
    else
      ActiveRecord::Base.transaction do
        new_user = User.find_or_create_by(
          username: user_data.first_name + " " + user_data.last_name,
          email: user_data.email
        )
        auth = Authentication.new(provider: user_data.provider, uid: user_data.uid, token: user_data.token)
        auth.user_id = new_user.id
        auth.save
        new_user
      end
    end
  end
end
