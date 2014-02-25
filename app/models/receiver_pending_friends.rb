class ReceiverPendingFriends
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def friends
    Friendship.where("receiver_id = :id and status = 'pending'", id: user.id).includes(:requester)
  end
end
