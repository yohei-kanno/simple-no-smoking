class Contact < ApplicationRecord
  validates :name, presence: true 
  validates :email, presence: true
  validates :content, presence: true 
  enum mode:{ not_selected: 0, no_smoking_mode: 1, reduction_mode: 2}
end
