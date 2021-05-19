class SorceryCore < ActiveRecord::Migration[6.1]
  def change
    create_table :users, id: false do |t|
      t.string :id, limit: 36, null: false, primary_key: true
      t.string :name, null: false
      t.string :email, null: false
      t.string :crypted_password
      t.string :salt

      t.integer :smoke_mode, default: 0
      t.timestamps null: false
    end

    add_index :users, :email, unique: true
  end
end
