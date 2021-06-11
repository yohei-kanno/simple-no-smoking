class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications
  include IdGenerator
  enum admin: { 一般ユーザー: false, 管理者ユーザー: true }
  
  validates_acceptance_of "利用規約",message: "に同意して下さい", allow_nil: false, on: :create
  validates :name, presence: true,length: { maximum: 20 }  
  validates :email, uniqueness: true
  validates :email, presence: true,
    if: Proc.new{ |user| user.authentications}
  validates :birth_date, presence: true
  
  validates :password, presence: true,length: { minimum: 6 } ,on: :create 
  validates :password_confirmation, presence: true,length: { minimum: 6 }, on: :create
  validates :password, confirmation: true
  
  validates :reset_password_token, uniqueness: true, allow_nil: true
  has_one :no_smoking_user_profile, dependent: :destroy, class_name: 'NoSmokingUserProfile'
  has_one :reduction_user_profile, dependent: :destroy, class_name: "ReductionUserProfile"
  has_one :mode, dependent: :destroy, class_name: "Mode"
end
