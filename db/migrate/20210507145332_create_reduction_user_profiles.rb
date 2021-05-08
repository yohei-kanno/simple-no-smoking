class CreateReductionUserProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :reduction_user_profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :tabaco_price, null: false
      t.integer :smoking_pace,  null: false
      t.integer :hourly_wage, null: false
      t.datetime :start_date, null: false, default: DateTime.now

      t.timestamps
    end
  end
end
