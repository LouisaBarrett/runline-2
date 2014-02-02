require 'spec_helper'

describe Calculator do
  before do
    @user = FactoryGirl.create(:user)
    FactoryGirl.create(:run, run_time: 2455, distance: 4000, user_id: @user.id)
    FactoryGirl.create(:run, run_time: 2355, distance: 3000, user_id: @user.id)
    @calculator = Calculator.new(@user)
  end

  it "calculates a runners's total distance in meters" do
    expect(@calculator.total_distance).to eq(7000)
  end

  it "calculates a runner's longest run in meters" do
    expect(@calculator.longest_run).to eq(4000)
  end

  it "calculates a runner's total average pace per mile in seconds" do
    expect(@calculator.total_average_pace_per_mile).to eq(1105.8464857142856)
  end
end
