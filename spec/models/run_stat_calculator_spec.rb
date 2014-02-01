require 'spec_helper'

describe RunStatCalculator do

  describe '.total_average_mile_pace_for' do
    xit 'should calculate the correct value' do
      @user1 = FactoryGirl.create(:user, username: "user1")
      fast_run = FactoryGirl.create(:run, run_time: 100, distance: 4000, user_id: @user1.id)
      slow_run = FactoryGirl.create(:run, run_time: 200, distance: 4000, user_id: @user1.id)
      expect(RunStatCalculator.total_average_mile_pace_for(@user1)).to be_within(0.5).of(60)
    end
  end
end


