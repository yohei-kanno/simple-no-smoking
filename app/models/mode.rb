class Mode < ApplicationRecord
  belongs_to :user
  validates :mode, presence: true, inclusion:{ in: %w( no_smoking_mode reduction_mode ) }
  enum mode:{no_smoking_mode: 0, reduction_mode: 1}
end
