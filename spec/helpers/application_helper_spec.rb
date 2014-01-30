require "spec_helper"

describe "Formatting" do
  it "formats for seconds that are more than 1 hour" do
    seconds = 4500
    formatter = ApplicationHelper::Formatting.format_pace(seconds)
    expect("1:15:00").to eq(formatter)
  end
 
  it "formats for seconds that are less than 1 hour" do
    seconds = 1500
    formatter = ApplicationHelper::Formatting.format_pace(seconds)
    expect("25:00").to eq(formatter)
  end

  xit "formats for seconds that are less than 1 minute" do
    seconds = 54
    formatter = ApplicationHelper::formatting.format_pace(seconds)
    expect("00:54").to eq(formatter)
  end

  xit "can accept seconds that are integers or floats" do
    seconds = 1159.2
    formatter = ApplicationHelper::formatting.format_pace(seconds)
    expect("19:32")
  end
end
