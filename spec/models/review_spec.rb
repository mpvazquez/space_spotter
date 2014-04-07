require 'spec_helper'

describe Review do
  before do
    FactoryGirl.create(:review)
  end

  it { should belong_to :customer}
  it { should belong_to :vendor} 
  it { should validate_presence_of :review_text}
  it { should validate_presence_of :review_score}
end
