require 'spec_helper'

describe ApprovedFriends do

  before do
    @user1 = create_user(username: "user1")
    @user2 = create_user(username: "user2")
    @user3 = create_user(username: "user3")
    @user4 = create_user(username: "user4")
    create_friendship(requester: 1, receiver: 2, status: "approved")
    create_friendship(requester: 1, receiver: 3, status: "approved")
    create_friendship(requester: 2, receiver: 3, status: "approved")
    create_friendship(requester: 4, receiver: 3, status: "approved")
  end

  it "finds all approved friends" do
    expect(ApprovedFriends.new(@user1).friends.count).to eq(2)
    expect(ApprovedFriends.new(@user2).friends.count).to eq(2)
    expect(ApprovedFriends.new(@user3).friends.count).to eq(3)
    expect(ApprovedFriends.new(@user4).friends.count).to eq(1)
  end
end

