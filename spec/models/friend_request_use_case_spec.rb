require 'spec_helper'

describe FriendRequestUseCase do
  it "creates a pending friendship" do
    @requester = create_user(username: "user1")
    @receiver1 = create_user(username: "user2")
    @receiver2 = create_user(username: "user3")
    FriendRequestUseCase.new(@requester, @receiver1).process
    FriendRequestUseCase.new(@requester, @receiver2).process
    expect(RequesterPendingFriends.new(@requester).friends.count).to eq(2)
  end
end
