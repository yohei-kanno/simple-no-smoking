class NoSmokingUserProfile < ApplicationRecord
  belongs_to :user
  validates :start_date, presence: true
  validates :tabaco_price, presence: true, numericality: {greater_than: 0}
  validates :smoking_pace, presence: true, numericality: { greater_than: 0}
  validates :hourly_wage, presence: true, numericality: { greater_than: 0}
end
