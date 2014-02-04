class AddFriendUseCase

  def initialize(user, friend)
    @user = user
    @friend = friend
  end

  def run!
    unless @user.total_approved_friends.include?(@friend)
      Friendship.create(user_id: @user.id, friend_id: @friend.id, status: "pending")
      FriendRequestNotifier.request_friend(@friend.email, @user.username, "http://runline.tk").deliver
    end
  end
end
