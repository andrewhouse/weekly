class ChangeRoleInUser < ActiveRecord::Migration
  def change
    change_column :users, :role, :string, default: "artist"
  end
end
