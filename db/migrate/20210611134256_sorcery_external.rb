class SorceryExternal < ActiveRecord::Migration[6.1]
  def change
    create_table :authentications do |t|
      t.references :user, limit: 36,null: false, foreign_key: true, type: :string
      t.string :provider, :uid, null: false

      t.timestamps              null: false
    end

    add_index :authentications, [:provider, :uid]
  end
end