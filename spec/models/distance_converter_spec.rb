require 'spec_helper'

describe DistanceConverter do

  before do
    @user = FactoryGirl.create(:user)
    FactoryGirl.create(:run, run_time: 100, distance: 4000, user_id: @user.id)
    FactoryGirl.create(:run, run_time: 200, distance: 3000, user_id: @user.id)
  end

  it 'converts distance into miles' do
    total_distance = Calculator.new(@user).total_distance
    expect(DistanceConverter.new(total_distance).miles).to eq(4.349609156548648)

  end
end

