class AllFriendships
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def friends
    Friendship.where("receiver = :id or requester = :id", id: user.id)
  end
end
