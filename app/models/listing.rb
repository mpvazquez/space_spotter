class Listing < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :rate, presence: true

  belongs_to :vendor
end
