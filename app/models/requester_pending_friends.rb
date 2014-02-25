class RequesterPendingFriends
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def friends
    Friendship.where("requester_id = :id and status = 'pending'", id: user.id).includes(:receiver)
  end
end
