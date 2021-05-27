class AddStatusToContacts < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :answered, :integer, null: false, default: 0
  end
end
