class Customer < User
  has_many :bookings
  has_many :listings, through: :bookings
end
