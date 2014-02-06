require 'spec_helper'

describe FriendRequestUseCase do
  it "creates a pending friendship" do
    @user1 = create_user(username: "user1")
    @user2 = create_user(username: "user2")
    @user3 = create_user(username: "user3")
    FriendRequestUseCase.new(@user1, @user2).process
    FriendRequestUseCase.new(@user1, @user3).process
    expect(@user1.total_pending_friends.count).to eq(2)
  end
end
