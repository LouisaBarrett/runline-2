require 'spec_helper'

describe Run do
  before do
    @user1 = FactoryGirl.create(:user)
  end

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:distance) }
  it { should validate_presence_of(:run_time) }
  it { should validate_presence_of(:workout_datetime) }
  it { should belong_to(:user) }

  it "should be created with valid attributes" do 
    FactoryGirl.create(:run).should be_valid
  end

  it "should be valid without a name" do 
    run = FactoryGirl.create(:run)
    run.update(name: nil)
    expect(run).to be_valid
  end

  it "converts the distance of a run into miles" do
    run = FactoryGirl.create(:run)
    expect(run.miles).to eq(3.106863683249034)
    run2 = FactoryGirl.create(:second_run)
    expect(run2.miles).to eq(6.213727366498068)
  end

  # it "converts the run time to hours, minutes and seconds" do 
  #   run = FactoryGirl.create(:run)
  #   expect(run.time_in_minutes).to eq("15:40")
  #   run2 = FactoryGirl.create(:second_run, :run_time => 5200)
  #   expect(run2.time_in_minutes).to eq("1:26:40")
  #   run3 = FactoryGirl.create(:second_run, :run_time => 10400)
  #   expect(run3.time_in_minutes).to eq("2:53:20")
  #   run4 = FactoryGirl.create(:run, :run_time => 94)
  #   expect(run4.time_in_minutes).to eq("1:34")
  # end

  xit "finds the total miles for all a user's runs" do 
    FactoryGirl.create(:run)
    FactoryGirl.create(:second_run)
    expect(@user1.runs.count).to eq(2)
    expect(@user1.runs.total_miles).to eq(9.320591049747101)
  end

  it "finds the average mile pace for all a user's runs" do 
    FactoryGirl.create(:run)
    FactoryGirl.create(:second_run)
    expect(@user1.total_average_mile_pace).to eq("5:15")
  end

  it "finds a user's fastest run" do 
    FactoryGirl.create(:run, run_time: 500, distance: 5000)
    faster_run = FactoryGirl.create(:second_run, run_time: 200, distance: 4000)
    expect(@user1.fastest_run.run_time).to eq(faster_run.run_time)
  end

  it "finds the longest run from a user's runs" do
    run = FactoryGirl.create(:run)
    FactoryGirl.create(:second_run, distance: 4500)
    FactoryGirl.create(:run, distance: 15)
    expect(@user1.longest_run.distance).to eq(run.distance)
  end


end
