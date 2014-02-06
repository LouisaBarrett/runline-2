require "spec_helper"

describe RemoveFriendshipUseCase do

  before do
    @user1 = create_user(username: "user1")
    @user2 = create_user(username: "user2")
    @user3 = create_user(username: "user3")
    @user4 = create_user(username: "user4")
    create_friendship(user_id: 1, friend_id: 2, status: "approved")
    create_friendship(user_id: 1, friend_id: 3, status: "approved")
    create_friendship(user_id: 2, friend_id: 3, status: "approved")
  end

  it "removes a pending friendship" do
    expect(Friendship.count).to eq(3)
    @requester = @user1
    @receiver = @user4
    FriendRequestUseCase.new(@requester, @receiver).process
    expect(Friendship.count).to eq(4)
    expect(@receiver.total_pending_friends.count).to eq(1)
    RemoveFriendshipUseCase.new(@requester, @receiver).process
    expect(Friendship.count).to eq(3)
    expect(@receiver.total_pending_friends.count).to eq(0)
  end

  # it "removes an approved friendship" do
  #   @requester = create_user(username: "user1")
  #   @receiver = create_user(username: "user2")
  #   FriendRequestUseCase.new(@requester, @receiver).process
  #   ApproveFriendUseCase.new(@requester, @receiver).process
  #   expect(@receiver.total_approved_friends.count).to eq(1)
  #   expect(@requester.total_approved_friends.count).to eq(1)
  #   RemoveFriendshipUseCase.new(@requester, @receiver).process
  #   expect(@receiver.total_approved_friends.count).to eq(0)
  #   expect(@requester.total_approved_friends.count).to eq(0)
  # end

  # it "can remove a friend" do
  #   expect(@user1.total_approved_friends.count).to eq(2)
  #   friendship = Friendship.find_by(user_id: @user1.id, friend_id: @user2.id)
  #   expect(Friendship.count).to eq(3)
  #   friendship.remove
  #   expect(Friendship.count).to eq(2)
  #   expect(@user1.total_approved_friends.count).to eq(1)
  # end

  # it "can reject a friend" do 
  #   expect(@user1.total_pending_friends.count).to eq(0)
  #   friendship = create_friendship(user_id: @user4.id, friend_id: @user1.id, status: "pending")
  #   expect(@user1.total_pending_friends.count).to eq(1)
  #   expect(Friendship.count).to eq(4)
  #   friendship.reject
  #   expect(Friendship.count).to eq(3)
  #   expect(@user1.total_pending_friends.count).to eq(0)
  # end
end
