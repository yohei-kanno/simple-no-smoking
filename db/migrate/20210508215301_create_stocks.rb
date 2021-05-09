class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.integer :counter
      t.references :reduction_user_profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
