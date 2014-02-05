require 'spec_helper'

describe Run do

  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:distance) }
  it { should validate_presence_of(:run_time) }
  it { should validate_presence_of(:workout_datetime) }
  it { should belong_to(:user) }

  it "should be created with valid attributes" do
    new_run.should be_valid
  end

  it "should be valid without a name" do 
    run = new_run
    run.update(name: nil)
    expect(run).to be_valid
  end

end
