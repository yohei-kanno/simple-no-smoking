class AddCountToReductionUserProfile < ActiveRecord::Migration[6.1]
  def change
    add_column :reduction_user_profiles, :smoking_count, :integer, default: 0
  end
end
