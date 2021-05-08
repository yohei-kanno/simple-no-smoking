class ReductionUserProfile < ApplicationRecord
  belongs_to :user
  validates :start_date, presence: true
  validates :tabaco_price, presence: true
  validates :smoking_pace, presence: true
  validates :hourly_wage, presence: true
end
