class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :item_id
      t.string :text

      t.timestamps
    end
  end
end
