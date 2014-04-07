require 'spec_helper'

describe Timeslot do
  before do
    FactoryGirl.create(:timeslot)
  end

  it { should belong_to :listing}
  it { should validate_presence_of :date}
  it { should validate_presence_of :start_time}
  it { should validate_presence_of :stop_time}
end
