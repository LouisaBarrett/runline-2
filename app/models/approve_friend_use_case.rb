class ApproveFriendUseCase
  attr_reader :friendship

  def initialize(friendship)
    @friendship = friendship
  end

  def process
    friendship.update(status: "approved")
  end
end
