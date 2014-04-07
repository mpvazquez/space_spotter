class Timeslot < ActiveRecord::Base
  validates :date, presence: true
  validates :start_time, presence: true
  validates :stop_time, presence: true
  validates_associated :listing
  
  belongs_to :listing
end
