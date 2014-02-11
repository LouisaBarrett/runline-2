require 'spec_helper'

describe ApproveFriendUseCase do
  it "approves a pending friendship" do
    @requester = create_user(username: "user1")
    @receiver = create_user(username: "user2")
    friendship = FriendRequestUseCase.new(@requester, @receiver).process
    expect(AllFriendships.new(@requester).friends.count).to eq(1)
    expect(AllFriendships.new(@receiver).friends.count).to eq(1)
    ApproveFriendUseCase.new(friendship).process
    expect(ApprovedFriends.new(@requester).friends.count).to eq(1)
    expect(ApprovedFriends.new(@receiver).friends.count).to eq(1)
    expect(ReceiverPendingFriends.new(@receiver).friends.count).to eq(0)
    expect(RequesterPendingFriends.new(@requester).friends.count).to eq(0)
  end

  it "does not create a new friendship id when one already exists" do
    @requester = create_user(username: "user1")
    @receiver = create_user(username: "user2")
    friendship = FriendRequestUseCase.new(@requester, @receiver).process
    expect(Friendship.all.count).to eq(1)
    expect(friendship.id).to eq(1)
    ApproveFriendUseCase.new(friendship).process
    expect(friendship.status).to eq("approved")
  end
end
