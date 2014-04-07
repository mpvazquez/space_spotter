class Booking < ActiveRecord::Base
  validates :price, presence: true
  validates_associated :timeslot
  validates_associated :customer

  belongs_to :customer
  belongs_to :timeslot
end
