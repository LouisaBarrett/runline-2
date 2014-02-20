require './spec/fake_run'
require './app/models/calculator'
require './app/models/distance_converter'

describe Calculator do
  let(:runs){[FakeRun.new(4000, 2455), FakeRun.new(3000, 2355)]}
  let(:calc){Calculator.new(runs)}

  it "calculates a runners's total distance in meters" do
    expect(calc.total_distance).to eq(7000)
  end

  it "calculates a runner's longest run in meters" do
    expect(calc.longest_run).to eq(4000)
  end

  it "calculates a runner's total average pace per mile in seconds" do
    expect(calc.total_average_pace_per_mile).to eq(1105.8464857142856)
  end
end
