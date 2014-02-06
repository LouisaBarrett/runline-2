class FriendRequestUseCase

  def initialize(requester, receiver)
    @requester = requester
    @receiver = receiver
  end

  def process
    unless @requester.total_approved_friends.include?(@receiver)
      Friendship.create(user_id: @receiver.id, friend_id: @requester.id, status: "pending")
      FriendRequestNotifier.request_friend(@receiver.email, @requester.username, "http://runline.tk").deliver
    end
  end
end
