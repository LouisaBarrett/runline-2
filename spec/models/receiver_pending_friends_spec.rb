require 'spec_helper'

describe ReceiverPendingFriends do

  before do
    @user1 = create_user(username: "user1")
    @user2 = create_user(username: "user2")
    @user3 = create_user(username: "user3")
    @user4 = create_user(username: "user4")
    create_friendship(requester: @user1.id, receiver: @user2.id, status: "pending")
    create_friendship(requester: @user1.id, receiver: @user3.id, status: "pending")
    create_friendship(requester: @user2.id, receiver: @user3.id, status: "pending")
    create_friendship(requester: @user4.id, receiver: @user3.id, status: "pending")
  end

  it "finds all approved friends" do
    expect(ReceiverPendingFriends.new(@user1).friends.count).to eq(0)
    expect(ReceiverPendingFriends.new(@user2).friends.count).to eq(1)
    expect(ReceiverPendingFriends.new(@user3).friends.count).to eq(3)
    expect(ReceiverPendingFriends.new(@user4).friends.count).to eq(0)
  end
end
