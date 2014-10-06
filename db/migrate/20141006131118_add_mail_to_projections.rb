class AddMailToProjections < ActiveRecord::Migration
  def change
    add_column :projections, :mail, :boolean, default: false
  end
end
