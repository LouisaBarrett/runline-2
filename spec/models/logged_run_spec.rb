require "./app/models/logged_run"
require './app/models/distance_converter.rb'
require './app/models/formatter.rb'
require 'spec_helper'

describe LoggedRun do
  FakeSingleRun = Struct.new(:name, :distance, :run_time, :workout_datetime)
  let(:run){FakeSingleRun.new("Yesterday's Run", 5000, 940, "2014-01-28T17:49:59+00:00")}
  let(:logged_run){LoggedRun.new(run)}

  it "displays name of each run" do
    expect(logged_run.name).to eq("Yesterday's Run")
  end

  it "displays a run's distance in miles rounded to 2 decimal places" do
    expect(logged_run.miles).to eq(3.106863683249034)
  end

  it "displays a runtime in stopwatch format" do
    expect(logged_run.stopwatch).to eq("15:40")
  end

  it "displays a run date in 'Day, MM/DD/YY'" do
    expect(logged_run.date).to eq("Tue, 01/28/14")
  end

  it "displays the pace" do
    expect(logged_run.pace).to eq("5:02")
  end

end
