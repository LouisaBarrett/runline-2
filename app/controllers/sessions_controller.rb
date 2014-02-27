require "pry"
class SessionsController < ApplicationController

  def create
    if current_user
      auth_hash = request.env['omniauth.auth']
      auth = current_user.authentications.where(provider: params[:provider]).first_or_initialize
      auth.update_attributes! uid: auth_hash.uid, token: auth_hash.credentials.token
    else
      user_data = MapMyFitness::User.new(request.env["omniauth.auth"])

      @user = FindOrCreateUser.find_or_create_by_auth(user_data)

      photo_store = MapMyFitness::PhotoStore.new(@user.authentications.first.token)
      photo_url = photo_store.photo_by(@user.authentications.first.uid)


      @user.update_attributes(photo_url: photo_url.first.url)
      #@user.update_attributes(token: user_data.token, photo_url: photo_url.first.url)
      session[:user_id] = @user.id
      @user.save!
    end
    
    redirect_to dashboard_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
