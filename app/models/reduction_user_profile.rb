class ReductionUserProfile < ApplicationRecord
  include IdGenerator
  
  belongs_to :user
  has_many :stocks, dependent: :destroy
  validates :start_date, presence: true
  validates :tabaco_price, presence: true
  validates :smoking_pace, presence: true
  validates :hourly_wage, presence: true
end
