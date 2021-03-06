require 'spec_helper'

describe Customer do
  before do
   FactoryGirl.create(:customer)
  end

  it { should validate_presence_of :first_name}
  it { should validate_presence_of :last_name}
  it { should validate_presence_of :email}
  it { should validate_uniqueness_of :email}
  it { should validate_presence_of :username}
  it { should validate_uniqueness_of :username}
  it { should validate_presence_of :zip_code}
  it { should have_secure_password}
  it { should validate_presence_of :password_digest}
end
