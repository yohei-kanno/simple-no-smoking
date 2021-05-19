class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.integer :counter, default: 0
      t.references :reduction_user_profile,limit: 36, null: false, foreign_key: true, type: :string

      t.timestamps
    end
  end
end
