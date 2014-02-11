require "spec_helper"

describe RemoveFriendshipUseCase do

  before do
    @user1 = create_user(username: "user1")
    @user2 = create_user(username: "user2")
    @user3 = create_user(username: "user3")
    @user4 = create_user(username: "user4")
    create_friendship(requester: 1, receiver: 2, status: "approved")
    create_friendship(requester: 1, receiver: 3, status: "approved")
    create_friendship(requester: 2, receiver: 3, status: "approved")
  end

  it "removes a pending friendship" do
    expect(Friendship.count).to eq(3)
    @requester = @user1
    @receiver = @user4
    new_friendship = FriendRequestUseCase.new(@requester, @receiver).process
    expect(Friendship.count).to eq(4)
    expect(ReceiverPendingFriends.new(@receiver).friends.count).to eq(1)
    RemoveFriendshipUseCase.new(new_friendship).process
    expect(Friendship.count).to eq(3)
    expect(ReceiverPendingFriends.new(@receiver).friends.count).to eq(0)
  end

  it "removes an approved friendship" do
    expect(Friendship.count).to eq(3)
    @requester = @user1
    @receiver = @user4
    new_friendship = FriendRequestUseCase.new(@requester, @receiver).process
    expect(Friendship.count).to eq(4)
    expect(ReceiverPendingFriends.new(@receiver).friends.count).to eq(1)
    ApproveFriendUseCase.new(new_friendship).process
    expect(RequesterPendingFriends.new(@requester).friends.count).to eq(0)
    RemoveFriendshipUseCase.new(new_friendship).process
    expect(Friendship.count).to eq(3)
    expect(ReceiverPendingFriends.new(@receiver).friends.count).to eq(0)
  end
end
