class UpdateUsersWithName < ActiveRecord::Migration[7.0]
  def up
    User.update_all(name: 'Default Name')
  end

  def down
    User.update_all(name: nil)
  end
end
