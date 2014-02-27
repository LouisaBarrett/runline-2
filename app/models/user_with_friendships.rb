require 'delegate'
class UserWithFriendships < SimpleDelegator

  def requester_pending_friendships
    RequesterPendingFriends.new(self).friends
  end

  def receiver_pending_friendships
    ReceiverPendingFriends.new(self).friends
  end

  def approved_friendships
    ApprovedFriends.new(self).friends
  end

  def self.model_name
    User.model_name
  end

end
