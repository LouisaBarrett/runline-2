require "./app/models/run_log"
require "spec_helper"

describe RunLog do
  # @user1 = FactoryGirl.create(:user, username: "user1")
  # run = FactoryGirl.create(:run)
  user = User.create!(username: "Bree", email: "louisa@example.com")
  run = Run.create(name: "Yesterday's Run", user_id: user.id, distance: 5000, run_time: 940, workout_datetime: "2014-01-28T17:49:59+00:00")
  run_log = RunLog.new(run)
  # second_run = FactoryGirl.create(:second_run)
  # FakeRun = Struct.new(:distance, :run_time, :workout_datetime, :name)
  # let(:runs){[FakeRun.new(4000, 2455, "2014-01-28T17:49:59+00:00", "Long run")]}
  # let(:run_logs){RunLogs.new(runs)}

  it "displays name of each run" do
    expect(run_log.name).to eq("Yesterday's Run")
  end

  it "displays a run's distance in miles rounded to 2 decimal places" do
    expect(run_log.distance).to eq(3.11)
  end

  it "displays a runtime in stopwatch format" do
    expect(run_log.run_time).to eq("15:40")
  end

  it "displays a run date in 'Day, MM/DD/YY'" do
    expect(run_log.run_date).to eq("Tue, 01/28/14")
  end

end
