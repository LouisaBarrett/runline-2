require 'spec_helper'

describe ApproveFriendUseCase do
  it "approves a pending friendship" do
    @requester = create_user(username: "user1")
    @receiver = create_user(username: "user2")
    friendship = FriendRequestUseCase.new(@requester, @receiver).process
    ApproveFriendUseCase.new(friendship).process
    expect(@receiver.receiver_pending_friendships.count).to eq(1)
    expect(@requester.requester_pending_friendships.count).to eq(1)
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
