require 'spec_helper'

describe RequesterPendingFriends do

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
    expect(RequesterPendingFriends.new(@user1).friends.count).to eq(2)
    expect(RequesterPendingFriends.new(@user2).friends.count).to eq(1)
    expect(RequesterPendingFriends.new(@user3).friends.count).to eq(0)
    expect(RequesterPendingFriends.new(@user4).friends.count).to eq(1)
  end
end
