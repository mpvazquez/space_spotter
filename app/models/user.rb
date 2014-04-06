class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: :true, uniqueness: :true 
  validates :username, presence: true, uniqueness: true
  validates :phone_number, presence: true
  validates :password_digest, presence: true

  has_secure_password
end
