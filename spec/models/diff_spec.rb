require './app/models/stats'
require './app/models/calculator'
require './app/models/distance_converter'
require './app/models/formatter'
require './app/models/logged_run'
require './app/models/diff'

describe Diff do
  FakeRun = Struct.new(:distance, :run_time)
  let(:user_runs){[FakeRun.new(4000, 2455), FakeRun.new(3000, 2355)]}
  let(:friend_runs){[FakeRun.new(4444, 4455), FakeRun.new(3333, 1234)]}
  let(:user_stats){Stats.new(user_runs)}
  let(:friend_stats){Stats.new(friend_runs)}
  let(:diff){Diff.new(user_stats, friend_stats)}

  it "compares miles" do
    expect(diff.miles).to eq(0)
  end

end
