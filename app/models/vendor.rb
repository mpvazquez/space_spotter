class Vendor < User
  validates :phone_number, presence: true
  has_many :bookings, through: :listings
end
