require 'spec_helper'

describe Friendship do

  before do
    @user1 = create_user(username: "user1")
    @user2 = create_user(username: "user2")
    @user3 = create_user(username: "user3")
    @user4 = create_user(username: "user4")
    create_friendship(requester_id: 1, receiver_id: 2, status: "approved")
    create_friendship(requester_id: 1, receiver_id: 3, status: "approved")
    create_friendship(requester_id: 2, receiver_id: 3, status: "approved")
  end

  it { should validate_presence_of(:requester_id) }
  it { should validate_presence_of(:receiver_id) }
  it { should validate_presence_of(:status) }
end
