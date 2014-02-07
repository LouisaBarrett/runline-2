class RemoveFriendshipUseCase

  attr_reader :friendship

  def initialize(friendship)
    @friendship = friendship
  end

  def process
    Friendship.destroy(friendship.id)
  end

end
