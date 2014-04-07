class SpotMail < ActiveRecord::Base
  validates :message_text, presence: true
  validates_associated :booking
  validates_associated :customer

  belongs_to :booking
  belongs_to :customer
end
