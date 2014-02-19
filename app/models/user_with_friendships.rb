require 'delegate'

class UserWithFriendships < SimpleDelegator

  def pending_friends
    RequesterPendingFriends.new(self).friends
  end

end
