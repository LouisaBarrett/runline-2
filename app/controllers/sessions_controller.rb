require "pry"
class SessionsController < ApplicationController

  def create
    user_data = MapMyFitness::User.new(request.env["omniauth.auth"])
    
    @user = FindOrCreateUser.find_or_create_by_auth(user_data)
    # @user = User.find_or_create_by_auth(user_data)

    #NOTE: authentication.first will need to be refactored depending 
    # on how the two different authentication systems are set up
    photo_store = MapMyFitness::PhotoStore.new(@user.authentications.first.token)
    #NOTE: should this be in a model?
    photo_url = photo_store.photo_by(@user.authentications.first.uid)


    @user.update_attributes(photo_url: photo_url.first.url)
    #@user.update_attributes(token: user_data.token, photo_url: photo_url.first.url)
    session[:user_id] = @user.id
    @user.save!
    
    redirect_to dashboard_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
