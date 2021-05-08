class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  
  validates :reset_password_token, uniqueness: true, allow_nil: true
  has_one :no_smoking_user_profile, dependent: :destroy, class_name: 'NoSmokingUserProfile'
  has_one :reduction_user_profile, dependent: :destroy, class_name: "ReductionUserProfile"
  has_one :mode, dependent: :destroy, class_name: "Mode"
end
