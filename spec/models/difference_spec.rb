require './app/models/difference'
require './app/models/stats'
require './app/models/calculator'
require './app/models/distance_converter'
require './app/models/formatter'
require './app/models/logged_run'

describe Difference do
  FakeRun = Struct.new(:distance, :run_time)
  let(:user_runs){[FakeRun.new(4000, 2455), FakeRun.new(3000, 2355)]}
  let(:friend_runs){[FakeRun.new(4444, 4455), FakeRun.new(3333, 1234)]}
  let(:user_stats){Stats.new(user_runs)}
  let(:friend_stats){Stats.new(friend_runs)}
  let(:difference){Difference.new(user_stats, friend_stats)}

  it "compares miles" do
    expect(difference.miles).to eq(-0.4828066163768998)
  end

  it "compares pace" do
    expect(difference.pace).to eq(-71.41148779735113)
  end

  it "compares longest run" do
    expect(difference.longest_run).to eq(-0.27588949507251437)
  end
end
