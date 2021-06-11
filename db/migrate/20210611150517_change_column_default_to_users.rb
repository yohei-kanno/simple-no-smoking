class ChangeColumnDefaultToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column_default :users, :birth_date, from: nil, to: Date.current
  end
end
