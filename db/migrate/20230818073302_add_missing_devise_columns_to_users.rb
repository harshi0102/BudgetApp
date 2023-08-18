class AddMissingDeviseColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email, :string, null: false, default: ""
    add_column :users, :encrypted_password, :string, null: false, default: ""
    # Add other Devise columns if necessary

    # Update existing records if needed
    User.update_all(email: "dummy@example.com") # Replace with an appropriate default email
  end
end
