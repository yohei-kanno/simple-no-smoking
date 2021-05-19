class CreateModes < ActiveRecord::Migration[6.1]
  def change
    create_table :modes do |t|
      t.integer :mode, null: false
      t.references :user, limit: 36,null: false, foreign_key: true,type: :string

      t.timestamps
    end
  end
end
