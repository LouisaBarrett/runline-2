class ApproveFriendUseCase
  attr_reader :friendship

  def initialize(friendship)
    @friendship = friendship
  end

  def process
    # friendship = Friendship.find_by(user_id: receiver.id, friend_id: requester.id) ||
    #   Friendship.find_by(user_id: requester.id, friend_id: receiver.id)
    friendship.update(status: "approved")
  end
end
