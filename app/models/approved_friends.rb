class ApprovedFriends
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def friends
    all_friendships.where(status: "approved")
  end

  private

  def all_friendships
    Friendship.where("receiver_id = :id or requester_id = :id", id: user.id)
  end
end
