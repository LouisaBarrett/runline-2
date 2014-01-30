require "spec_helper"

describe "Formatting" do
  it "formats for seconds that are more than 1 hour" do
    seconds = 4500
    formatter = ApplicationHelper::Formatting.format_for_seconds(seconds)
    expect("1:15:00").to eq(formatter)
  end

  it "formats for seconds that are less than 1 hour" do
    seconds = 1500
    formatter = ApplicationHelper::Formatting.format_for_seconds(seconds)
    expect("25:00").to eq(formatter)
  end

  it "formats for seconds that are less than 1 minute" do
    seconds = 54
    formatter = ApplicationHelper::Formatting.format_for_seconds(seconds)
    expect("00:54").to eq(formatter)
  end

  it "can accept seconds that are integers or floats" do
    seconds = 1159.2
    formatter = ApplicationHelper::Formatting.format_for_seconds(seconds)
    expect("19:19").to eq(formatter)
  end

  it "formats the workout date time to a readable date" do
    run = FactoryGirl.create(:run, workout_datetime: "2012-11-03T23:12:49+00:00")
    date = run.workout_datetime
    formatter = ApplicationHelper::Formatting.format_for_date(date)
    expect("Sat, 11/03/12").to eq(formatter)

  end
end
