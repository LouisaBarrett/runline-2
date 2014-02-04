require './app/models/stats.rb'
require './app/models/calculator.rb'
require './app/models/distance_converter.rb'
require './app/models/formatter.rb'
require './app/models/logged_run.rb'


describe Stats do
  FakeRun = Struct.new(:distance, :run_time)
  let(:runs){[FakeRun.new(4000, 2455), FakeRun.new(3000, 2355)]}
  let(:stats){Stats.new(runs)}

  it "presents a runner's total distance in miles rounded two decimal places" do
    expect(stats.total_distance).to eq(4.349609156548648)
  end

  it "presents a runner's longest run in miles rounded two decimal places" do
    expect(stats.longest_run).to eq(2.485490946599227)
  end

  it "presents a runner's average pace per mile" do
    expect(stats.average_pace).to eq(1105.8464857142856)
  end

  it "has logged runs" do
    expect(stats.logged_runs.map(&:stopwatch)).to eq(["40:55", "39:15"])
  end

end
