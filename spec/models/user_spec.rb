require 'spec_helper'

describe User do
  describe "POST #create" do
    before do
     FactoryGirl.create(:user)
    end

    it { should validate_presence_of :first_name}
    it { should validate_presence_of :last_name}
    it { should validate_presence_of :email}
    it { should validate_uniqueness_of :email}
    it { should validate_presence_of :username}
    it { should validate_uniqueness_of :username}
    it { should have_secure_password}
    it { should validate_presence_of :password_digest}
    it { should validate_presence_of :zip_code}
  end
end
