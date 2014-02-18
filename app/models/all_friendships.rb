class AllFriendships
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def friends
    Friendship.where("receiver_id = :id or requester_id = :id", id: user.id)
  end
end
