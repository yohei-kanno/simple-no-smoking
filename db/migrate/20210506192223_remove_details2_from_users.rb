class RemoveDetails2FromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :start_date, :datetime
  end
end
