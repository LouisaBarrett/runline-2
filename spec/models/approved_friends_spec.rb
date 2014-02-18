require 'spec_helper'

describe ApprovedFriends do

  before do
    @user1 = create_user(username: "user1")
    @user2 = create_user(username: "user2")
    @user3 = create_user(username: "user3")
    @user4 = create_user(username: "user4")
    create_friendship(requester_id: 1, receiver_id: 2, status: "approved")
    create_friendship(requester_id: 1, receiver_id: 3, status: "pending")
    create_friendship(requester_id: 2, receiver_id: 3, status: "approved")
    create_friendship(requester_id: 4, receiver_id: 3, status: "approved")
  end

  it "finds all approved friends" do
    expect(ApprovedFriends.new(@user1).friends.count).to eq(1)
    expect(ApprovedFriends.new(@user2).friends.count).to eq(2)
    expect(ApprovedFriends.new(@user3).friends.count).to eq(2)
    expect(ApprovedFriends.new(@user4).friends.count).to eq(1)
  end
end

