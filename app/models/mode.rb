class Mode < ApplicationRecord
  belongs_to :user
  
  enum mode:{no_smoking_mode: 0, reduction_mode: 1}
end
