class CreateNoSmokingUserProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :no_smoking_user_profiles do |t|
      t.references :user, limit: 36, null: false, foreign_key: true, type: :string
      t.integer :tabaco_price, null: false
      t.integer :smoking_pace, null: false
      t.integer :hourly_wage, null: false

      t.timestamps
    end
  end
end
