require 'spec_helper'

describe Booking do
  before do
    FactoryGirl.create(:booking)
  end

  it { should validate_presence_of :price}
  it { should belong_to :customer}
  it { should belong_to :timeslot}
end 
