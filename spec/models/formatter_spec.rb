require 'spec_helper'

describe Formatter do

  describe "formatting for time" do
    it "formats for seconds that are more than 1 hour" do
      expect("1:15:00").to eq(Formatter.new.format_for_seconds(4500))
    end

    it "formats for seconds that are less than 1 hour" do
      expect("25:00").to eq(Formatter.new.format_for_seconds(1500))
    end

    it "formats for seconds that are less than 1 minute" do
      expect("00:54").to eq(Formatter.new.format_for_seconds(54))
    end

    it "can accept seconds that are integers or floats" do
      expect("19:19").to eq(Formatter.new.format_for_seconds(1159.2))
    end
  end

  describe "formatting for date" do
    it "formats the workout date time to a readable date" do
      run = FactoryGirl.create(:run, workout_datetime: "2012-11-03T23:12:49+00:00")
      date = run.workout_datetime
      expect("Sat, 11/03/12").to eq(Formatter.new.format_for_date(date))
    end
  end
end
