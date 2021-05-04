class User < ApplicationRecord
  authenticates_with_sorcery!
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  
  has_one :no_smoking_user_profile, dependent: :destroy, class_name: 'NoSmokingUserProfile'
end
