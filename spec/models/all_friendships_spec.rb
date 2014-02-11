require 'spec_helper'

describe AllFriendships do

  before do
    @user1 = create_user(username: "user1")
    @user2 = create_user(username: "user2")
    @user3 = create_user(username: "user3")
    @user4 = create_user(username: "user4")
    create_friendship(requester: @user1.id, receiver: @user2.id, status: "pending")
    create_friendship(requester: @user1.id, receiver: @user3.id, status: "approved")
    create_friendship(requester: @user2.id, receiver: @user3.id, status: "pending")
    create_friendship(requester: @user4.id, receiver: @user3.id, status: "approved")
  end

  it "finds all approved friends" do
    expect(AllFriendships.new(@user1).friends.count).to eq(2)
    expect(AllFriendships.new(@user2).friends.count).to eq(2)
    expect(AllFriendships.new(@user3).friends.count).to eq(3)
    expect(AllFriendships.new(@user4).friends.count).to eq(1)
  end
end
