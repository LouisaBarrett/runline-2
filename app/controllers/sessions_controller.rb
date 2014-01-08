class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_by_auth(request.env["omniauth.auth"]['credentials'])
    session[:user_id] = @user.id
    redirect_to root_path, notice: "You are logged in!"
  end

end