class CompareController < ApplicationController

  def show
    @friend = find_current_friend(params[:id])
    unless current_user.runs.empty? || @friend.runs.empty?
      @user_stats = Stats.new(current_user.runs)
      @friend_stats = Stats.new(@friend.runs)
      @diff = Difference.new(@user_stats, @friend_stats)
    end
  end

  def find_current_friend(id)
    current_friend = []
    current_user.total_approved_friends.each do |friend|
      if friend.id == id.to_i
        current_friend << friend
      end
      current_friend
    end
    current_friend.first
  end

end
