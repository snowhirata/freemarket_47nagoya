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
      t.references :category, foreign_key: true
      t.references :child_category, foreign_key: {to_table: :categories}
      t.references :grand_child_category, foreign_key: {to_table: :categories}
      t.references :user, foreign_key: true
      # t.integer :seller_id, foreign_key: true
      t.references :buyer, foreign_key: {to_table: :users}
      # itemとuserのアソシエーション　user設定完了時追加
      t.timestamps
    end
  end
end
