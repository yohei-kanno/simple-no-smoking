class AddDetails2ToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :start_date, :datetime, null: false
  end
end
