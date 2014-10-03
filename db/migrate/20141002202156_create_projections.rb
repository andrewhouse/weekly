class CreateProjections < ActiveRecord::Migration
  def change
    create_table :projections do |t|
      t.decimal :price, precision: 7, scale: 2
      t.integer :user_id
      t.integer :item_id

      t.timestamps
    end
  end
end
