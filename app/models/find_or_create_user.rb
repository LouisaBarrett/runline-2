# class Authentication < AR::Base
#   validates :provider ...
#   belongs_to :user
# end

class FindOrCreateUser
 
  def self.find_or_create_by_auth(user_data)
    User.where(:provider => user_data.provider, :uid => user_data.uid).first_or_create(
      username: user_data.first_name + " " + user_data.last_name,
      email: user_data.email,
      token: user_data.token
    )

    # if Authentication.where(provider: user_data.provider, uid: user_data.uid).exist?
    #   auth = Authentication.where(provider: user_data.provider, uid: user_data.uid).first
    #   auth.user
    # else
    #   # AR.transaction do
    #     auth = Authentication.create(provider: user_data.provider, uid: user_data.uid)
    #     auth.user.create(
    #       username: user_data.first_name + " " + user_data.last_name,
    #       email: user_data.email,
    #       token: user_data.token
    #     )
    #   # end
    #   # bad
    #   # auth.destroy unless user.persisted?
    #   # user = User.create
    #   # user.authentications << auth
    # end
  end

end

# TRANSACTION
#   INSERT INTO users ('Mike')
#   INSERT INTO users ('Louisa')
# END
