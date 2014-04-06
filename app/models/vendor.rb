class Vendor < User
  validates :phone_number, presence: true
end
