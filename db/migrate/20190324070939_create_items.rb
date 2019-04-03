class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false, index: true
      t.text :description
      t.string :brand
      t.string :state, null: false
      t.integer :prefecture_id, foreign_key: true, null: false
      t.string :ship_charge, null: false
      t.string :ship_method
      t.string :ship_date, null: false
      t.integer :price, null: false
      # t.integer :seller_id, foreign_key: true
      # t.integer :buyer_id, foreign_key: true
      t.timestamps
    end
  end
end
