class InvitesController < ApplicationController

  def create
    FriendRequestNotifier.invite_new_friend(params[:email], current_user.username, "http://runline.tk").deliver
    flash[:notice] = {:class => "flash", :body => "Your request to #{params[:email]} has been sent!"}

    redirect_to :back
  end

end
