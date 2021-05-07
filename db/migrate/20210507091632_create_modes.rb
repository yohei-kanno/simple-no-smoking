class CreateModes < ActiveRecord::Migration[6.1]
  def change
    create_table :modes do |t|
      t.integer :mode, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
