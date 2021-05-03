class AddDetailsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :birth_date, :datetime
  end
end
