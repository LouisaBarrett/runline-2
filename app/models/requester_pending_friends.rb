class RequesterPendingFriends
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def friends
    all_friendships.where("requester_id = :id and status = 'pending'", id: user.id)
  end

  private

  def all_friendships
    Friendship.where("receiver_id = :id or requester_id = :id", id: user.id)
  end
end
