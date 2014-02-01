require 'spec_helper'

describe DistanceConverter do

  before do
    @user = FactoryGirl.create(:user)
    FactoryGirl.create(:run, run_time: 100, distance: 4000, user_id: @user.id)
    FactoryGirl.create(:run, run_time: 200, distance: 3000, user_id: @user.id)
  end

  it 'converts total distance into miles' do
    total_distance = Calculator.new(@user).total_distance
    expect(DistanceConverter.new(total_distance).miles).to eq(4.349609156548648)
  end

  it "converts longest run distance into miles" do
    longest_run = Calculator.new(@user).longest_run
    expect(DistanceConverter.new(longest_run).miles).to eq(2.485490946599227)
  end

end

