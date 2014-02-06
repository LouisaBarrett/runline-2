class FriendRequestUseCase

  def initialize(requester, receiver)
    @requester = requester
    @receiver = receiver
  end

  def process
    unless @requester.total_approved_friends.include?(@receiver)
      FriendRequestNotifier.request_friend(@receiver.email, @requester.username, "http://runline.tk").deliver
      Friendship.create(user_id: @requester.id, friend_id: @receiver.id, status: "pending")
    end
  end
end
