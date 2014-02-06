require 'spec_helper'

describe ApproveFriendUseCase do
  it "approves a pending friendship" do
    @requester = create_user(username: "user1")
    @receiver = create_user(username: "user2")
    FriendRequestUseCase.new(@requester, @receiver).process
    ApproveFriendUseCase.new(@requester, @receiver).process
    expect(@receiver.total_approved_friends.count).to eq(1)
    expect(@requester.total_approved_friends.count).to eq(1)
  end

  it "does not create a new friendship id when one already exists" do
    @requester = create_user(username: "user1")
    @receiver = create_user(username: "user2")
    FriendRequestUseCase.new(@requester, @receiver).process
    expect(Friendship.last.id).to eq(1)
    ApproveFriendUseCase.new(@requester, @receiver).process
    friendship = Friendship.find_by(user_id: @receiver.id, friend_id: @requester.id)
    expect(friendship.id).to eq(1)
  end
end
