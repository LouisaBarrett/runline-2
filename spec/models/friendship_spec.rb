require 'spec_helper'

describe Friendship do

  before do
    @user1 = create_user(username: "user1")
    @user2 = create_user(username: "user2")
    @user3 = create_user(username: "user3")
    @user4 = create_user(username: "user4")
    create_friendship(requester: 1, receiver: 2, status: "approved")
    create_friendship(requester: 1, receiver: 3, status: "approved")
    create_friendship(requester: 2, receiver: 3, status: "approved")
  end

  it { should validate_presence_of(:requester) }
  it { should validate_presence_of(:receiver) }
  it { should validate_presence_of(:status) }
  it { should belong_to(:user) }
  it { should belong_to(:friend) }

  xit "assigns many friends to a user" do 
    expect(@user1.friends.count).to eq(2)
  end

  it "assigns inverse friends to a user" do
    expect(@user2.inverse_friends.count).to eq(1)
  end
end
