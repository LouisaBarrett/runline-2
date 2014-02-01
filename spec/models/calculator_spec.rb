require 'spec_helper'

describe Calculator do
  before do
    @user = FactoryGirl.create(:user)
    FactoryGirl.create(:run, run_time: 100, distance: 4000, user_id: @user.id)
    FactoryGirl.create(:run, run_time: 200, distance: 3000, user_id: @user.id)
    @calculator = Calculator.new(@user)
  end

  it "calculates a runners's total distance" do
    expect(@calculator.total_distance).to eq(7000)
  end

  it "calculates a runner's longest run" do
    expect(@calculator.longest_run).to eq(4000)
  end
end
