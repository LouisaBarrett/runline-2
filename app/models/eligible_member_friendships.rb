class EligibleMemberFriendships

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def requestable_users
    potential_friends = []
    User.where("id != ?", user.id).collect do |friend|
      if !ReceiverPendingFriends.new(user).friends.include?(friend) && !RequesterPendingFriends.new(user).friends.include?(friend)
#      if !user.receiver_pending_friendships.include?(friend) && !user.requester_pending_friendships.include?(friend)
        potential_friends << friend
      end
    end
    potential_friends
  end

end
