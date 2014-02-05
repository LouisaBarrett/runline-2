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

    create_friendship(user_id: 1, friend_id: 2, status: "approved")
    create_friendship(user_id: 1, friend_id: 3, status: "approved")
    create_friendship(user_id: 7, friend_id: 1, status: "approved")
    create_friendship(user_id: 4, friend_id: 3, status: "approved")
    create_friendship(user_id: 2, friend_id: 3, status: "pending")
    create_friendship(user_id: 6, friend_id: 1, status: "pending")
  end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should have_many(:friendships) }
  it { should have_many(:friends) }
  it { should have_many(:inverse_friendships) }
  it { should have_many(:inverse_friends) }

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

  it "can count its friends" do
    expect(@user1.friends.count).to eq(2)
  end

  it "has total approved friends" do
    expect(@user1.total_approved_friends.count).to_not eq(0)
  end

  it "can count approved friends" do
    expect(@user1.total_approved_friends.count).to eq(3)
  end

  it "can approve a friend" do
    @user1.approve_friend(@user6)
    expect(@user1.total_approved_friends.count).to eq(4)
  end

  it "queries its approved friends" do
    expect(@user1.total_approved_friends).to include(@user2)
    expect(@user2.total_approved_friends).to include(@user1)
  end

  it "can find all users except the one passed in" do
    expect(User.except(@user1)).to_not include(@user1)
  end

  it "can find all users that are not pending or approved friends or myself" do
    expect(User.requestable_users(@user1)).to_not include(@user1)
    expect(User.requestable_users(@user1)).to include(@user4)
    expect(User.requestable_users(@user1)).to include(@user5)
    expect(User.requestable_users(@user1)).to_not include(@user2)
    expect(User.requestable_users(@user1)).to_not include(@user7)
    expect(User.requestable_users(@user1)).to_not include(@user6)
  end

end
