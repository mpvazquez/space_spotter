class Review < ActiveRecord::Base
  validates :review_score, presence: true
  validates :review_text, presence: true
  belongs_to :vendor
  belongs_to :customer
end
