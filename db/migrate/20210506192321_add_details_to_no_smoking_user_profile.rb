class AddDetailsToNoSmokingUserProfile < ActiveRecord::Migration[6.1]
  def change
    add_column :no_smoking_user_profiles, :start_date, :datetime, default: DateTime.now
  end
end
