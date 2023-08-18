class AddRememberableColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :remember_created_at, :datetime
    add_index :users, :remember_created_at
  end
end
