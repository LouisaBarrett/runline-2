class CompareController < ApplicationController

  def show
    @friend = find_current_friend(params[:id]) 
    unless current_user.runs.empty? || @friend.runs.empty?
      @user_stats = Stats.new(current_user.runs)
      @friend_stats = Stats.new(@friend.runs)
      @diff = Difference.new(@user_stats, @friend_stats)
    end
  end

  private

  def find_current_friend(friendship_id) 
    friendship = Friendship.find(friendship_id)
    User.find(friendship.requester) || User.find(friendship.receiver)
  end

end
