require 'spec_helper'

describe User do
  describe "POST #create" do
    it { should validate_presence_of :first_name}
    it { should validate_presence_of :last_name}
    it { should have_secure_password}
    it { should validate_presence_of :password_digest}
    it { should validate_presence_of :phone_number}
    it { should validate_uniqueness_of :email }
  end
end
