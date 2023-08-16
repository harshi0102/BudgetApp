class AddForeignKeyToOperations < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :operations, :users, column: :author_id, on_delete: :restrict
  end
end
