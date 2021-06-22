class ReductionUserProfile < ApplicationRecord
  include IdGenerator
  
  belongs_to :user
  has_many :stocks, dependent: :destroy
  validates :start_date, presence: true
  validates :tabaco_price, presence: true, numericality: { greater_than: 0}
  validates :smoking_pace, presence: true, numericality: { greater_than: 0}
  validates :hourly_wage, presence: true, numericality: { greater_than: 0}
  
  def self.smoking_in_second(user)
    DateTime.now.to_i - user.reduction_user_profile.start_date.to_i
  end
  
end
