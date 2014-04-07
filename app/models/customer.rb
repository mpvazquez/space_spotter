class Customer < User
  has_many :listings, through: :bookings
end
