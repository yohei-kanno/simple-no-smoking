class RemoveSmokeModeFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :smoke_mode, :integer
  end
end
