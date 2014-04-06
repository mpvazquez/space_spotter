require 'spec_helper'

describe Listing do
  before do
   FactoryGirl.create(:vendor)
   FactoryGirl.create(:listing)
  end

  it { should belong_to :vendor}
  it { should validate_presence_of :title}
  it { should validate_presence_of :description}
  it { should validate_presence_of :address}
  it { should validate_presence_of :city}
  it { should validate_presence_of :state}
  it { should validate_presence_of :zip_code}
  it { should validate_presence_of :rate}

  # it { should validate_presence_of :vendor_id }
end
