class CreateItems < ActiveRecord::Migration
  def changm
    create_table :items do |t|
      t.string :title
      t.text :description
      t.string :status
      t.string :link
      t.integer :user_id
      t.decimal :max_price, precision: 7, scale: 2  
      t.decimal :min_price, precision: 7, scale: 2

      t.timestamps
    end
  end
end
