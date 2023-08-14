class RemoveDuplicateForeignKeyConstraint < ActiveRecord::Migration[7.0]
  def up
    # Drop the duplicate foreign key constraint using SQL
    execute <<-SQL
      ALTER TABLE categories_expenses
      DROP CONSTRAINT IF EXISTS fk_rails_6099cd24a4
    SQL
  end

  def down
    # You can add back the foreign key constraint in the down migration if needed
    # add_foreign_key :categories_expenses, :categories, column: :category_id
  end
end
