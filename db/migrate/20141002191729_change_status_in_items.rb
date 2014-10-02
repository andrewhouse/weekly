class ChangeStatusInItems < ActiveRecord::Migration
  def change
    change_column :items, :status, :string, default: "projection"
  end
end
