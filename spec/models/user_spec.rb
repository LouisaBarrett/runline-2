require 'spec_helper'

describe User do

  before do
    @user1 = create_user(username: "user1")
    @user2 = create_user(username: "user2")
    @user3 = create_user(username: "user3")
    @user4 = create_user(username: "user4")
    @user5 = create_user(username: "user5")
    @user6 = create_user(username: "user6")
    @user7 = create_user(username: "user7")

    create_run(run_time: 100, distance: 4000, user_id: @user1.id)
    create_run(run_time: 200, distance: 4000, user_id: @user2.id)

    create_friendship(requester_id: @user1.id, receiver_id: @user2.id, status: "approved")
    create_friendship(requester_id: @user1.id, receiver_id: @user3.id, status: "approved")
    create_friendship(requester_id: @user7.id, receiver_id: @user1.id, status: "approved")
    create_friendship(requester_id: @user4.id, receiver_id: @user3.id, status: "approved")
    create_friendship(requester_id: @user2.id, receiver_id: @user3.id, status: "pending")
    create_friendship(requester_id: @user6.id, receiver_id: @user1.id, status: "pending")
  end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }

  it "should be created with valid attributes" do
    @user1.should be_valid
  end

  it "can have many runs" do
    create_run(user_id: @user1.id)
    create_run(user_id: @user1.id)
    expect(@user1.runs.size).to eq 3
  end

  xit "can fetch the runs for a user" do
    @user1.fetch_runs
  end

  it "can find all users except the one passed in" do
    expect(User.except(@user1)).to_not include(@user1)
  end

  it "has friends" do
    @user1.reload.friends.map(&:id).sort.should eq([2, 3, 7])
  end

end
