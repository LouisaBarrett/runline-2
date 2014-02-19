class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def disable_nav
    @disable_nav = true
  end

  def current_user
    @current_user ||= UserWithFriendships.new(lookup_user)
  end

# Not sure why this code block was in here...
#  def valid_users 
#    User.all.collect {|user| user.username}
#  end

  private

  def lookup_user
    if session[:user_id]
      User.find_by(id: session[:user_id]) || session[:user_id] = nil
    end
  end
end
