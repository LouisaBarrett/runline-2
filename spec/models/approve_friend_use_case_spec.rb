require 'spec_helper'

describe ApproveFriendUseCase do
  it "approves a pending friendship" do
    @requester = create_user(username: "user1")
    @receiver = create_user(username: "user2")
    FriendRequestUseCase.new(@requester, @receiver).process
#    Friendship.create(user_id: @receiver.id, friend_id: @requester.id, status: "pending")
    ApproveFriendUseCase.new(@requester, @receiver).process
    expect(@receiver.total_approved_friends.count).to eq(1)
    expect(@requester.total_approved_friends.count).to eq(1)
  end
end
